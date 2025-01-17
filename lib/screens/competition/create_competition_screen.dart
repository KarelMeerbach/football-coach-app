import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/competition_model.dart';
import 'package:football_coach_app/providers/competition_provider.dart';

import '../../enums/ECompetition_type.dart';

class CreateCompetitionScreen extends ConsumerStatefulWidget {
  final String teamId; // Accept teamId passed from the previous screen

  const CreateCompetitionScreen({super.key, required this.teamId});

  @override
  _CreateCompetitionScreenState createState() =>
      _CreateCompetitionScreenState();
}

class _CreateCompetitionScreenState extends ConsumerState<CreateCompetitionScreen> {
  final _formKey = GlobalKey<FormState>();
  String _competitionName = '';
  Competition_type _competitionType = Competition_type.kids; // Default type
  String _createdBy = ''; // Assuming the logged-in user’s name or ID
  DateTime _createdAt = DateTime.now();

  // Controller for form fields
  final TextEditingController _competitionNameController =
  TextEditingController();
  final TextEditingController _createdByController =
  TextEditingController();

  @override
  void dispose() {
    _competitionNameController.dispose();
    _createdByController.dispose();
    super.dispose();
  }

  // Function to handle form submission
  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final newCompetition = Competition(
        id: null, // ID will be assigned by Supabase
        name: _competitionName,
        competition_type: _competitionType.name, // Use enum here
        createdBy: FirebaseAuth.instance.currentUser!.uid,
        createdAt: _createdAt,
        team_id: int.parse(widget.teamId)
      );

      try {
        // Call the insert competition provider to add the competition
        await ref.read(insertCompetitionProvider(newCompetition));
        ref.invalidate(getCompetitionListByTeamIdProvider);

        // After success, navigate back
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Competition created successfully!')),
        );

        Navigator.pop(context); // Pop to previous screen after success
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating competition: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Competition'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Competition Name Field
              TextFormField(
                controller: _competitionNameController,
                decoration: const InputDecoration(labelText: 'Competition Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a competition name';
                  }
                  return null;
                },
                onChanged: (value) {
                  _competitionName = value;
                },
              ),
              const SizedBox(height: 16),

              // Competition Type Dropdown
              DropdownButtonFormField<Competition_type>(
                value: _competitionType,
                onChanged: (newValue) {
                  setState(() {
                    _competitionType = newValue!;
                  });
                },
                items: Competition_type.values.map((Competition_type type) {
                  return DropdownMenuItem<Competition_type>(
                    value: type,
                    child: Text(type.toString().split('.').last),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Competition Type'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a competition type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),


              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Create Competition'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
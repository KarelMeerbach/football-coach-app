import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/match_provider.dart';
import 'package:football_coach_app/models/match_model.dart';
import 'package:intl/intl.dart';

class CreateMatchPage extends ConsumerStatefulWidget {
  final int competition_id;

  // Accept competition_id as a parameter when navigating to this page
  const CreateMatchPage({Key? key, required this.competition_id}) : super(key: key);

  @override
  _CreateMatchPageState createState() => _CreateMatchPageState();
}

class _CreateMatchPageState extends ConsumerState<CreateMatchPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  DateTime _matchDate = DateTime.now();
  bool _isFinished = false;

  // Function to format the date
  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Match'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title Input
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Match Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a match title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Match Date Picker
              ListTile(
                title: const Text('Match Date'),
                subtitle: Text(formatDate(_matchDate)),
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _matchDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null && selectedDate != _matchDate) {
                    setState(() {
                      _matchDate = selectedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),

              // Finished Switch
              SwitchListTile(
                title: const Text('Match Finished'),
                value: _isFinished,
                onChanged: (bool value) {
                  setState(() {
                    _isFinished = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Create Match'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle form submission
  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Create a new match object from user inputs
      final match = Match(
        id: null,
        competition_id: widget.competition_id, // Use competition_id passed via constructor
        match_date: _matchDate,
        created_at: DateTime.now(),
        title: _titleController.text,
        created_by: FirebaseAuth.instance.currentUser!.uid, // Replace with actual user ID
        finsihed: _isFinished,
      );

      // Call the createMatch provider to insert the match into the database
      try {
        ref.read(createMatchProvider(match));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Match created successfully!')),
        );
        ref.invalidate(getMatchesFromCompetitionIdProvider);
        Navigator.pop(context); // Go back to the previous screen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating match: $e')),
        );
      }
    }
  }
}

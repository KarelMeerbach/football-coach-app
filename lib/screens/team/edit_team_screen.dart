import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/auth/register_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/default_appbar.dart';

class EditTeamScreen extends ConsumerWidget{
  EditTeamScreen({super.key, required this.id});

  final int? id;

  var teamname = "";
  var teamdesc = "";


  TextEditingController _teamName = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final getTeam = ref.watch(getTeamByIdProvider(id!));



    getTeam.when(data: (team)  => ReplaceValues(team.name, team.description), error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));


    return Scaffold(
      appBar: DefaultAppbar(title: "Edit Teams"),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _teamName,
                decoration: InputDecoration(labelText: 'Team Name'),
              ),
              TextField(
                controller: _description,
                decoration: InputDecoration(labelText: 'Description (optional)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () async {
                try{
                  await ref.read(updateTeamByIdProvider(id!, _teamName.text, _description.text));
                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Team edited successfully!')),
                  );

                  final fetchTeams = ref.watch(teamListProvider);

                  Navigator.of(context).pop();

                }catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),);
                }


              }, child: const Text("Edit Team"))

            ]

        ),
      ),
    );
  }

  void ReplaceValues(String name, String desc){
    _teamName.text = name;
    _description.text = desc;
  }

}
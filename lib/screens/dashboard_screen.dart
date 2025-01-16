import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/team/create_team_screen.dart';
import 'package:football_coach_app/screens/team/team_screen.dart';
import 'package:football_coach_app/widgets/default_appbar.dart';
import 'auth/login_screen.dart'; // Your login screen

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamSerivce = ref.watch(teamListProvider);

    return Scaffold(
      appBar: DefaultAppbar(title: "My Teams"),
      body: teamSerivce.when(
        data: (teams) {
          if (teams.isEmpty) {
            return const Center(child: Text("No teams created yet."));
          }
          return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              final team_id = team.id;
              return ListTile(
                title: Text(team.name),
                subtitle: Text(team.description),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TeamScreen(id: team_id,))),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateTeamScreen()))
              .then((_) {
            // Refresh the team list after returning from CreateTeamScreen
            ref.invalidate(teamListProvider);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
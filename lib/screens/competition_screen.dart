import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/competition_provider.dart';
import 'package:football_coach_app/providers/match_provider.dart';
import 'package:football_coach_app/screens/match_screen.dart';
import 'login_screen.dart';

String comp_name = "";

class CompetitionScreen extends ConsumerWidget{
  const CompetitionScreen({super.key, required this.comp_id, required this.team_id});

  final int? team_id;
  final int? comp_id;



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeam = ref.watch(getCompetitionByIdProvider(comp_id!));
    final getMatch = ref.watch(getMatchesFromCompetitionIdProvider(comp_id!));

    getTeam.when(data: (comp)  => ReplaceValues(comp.name), error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(
        title: Text(comp_name),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                // Log out from Firebase
                await FirebaseAuth.instance.signOut();
                // After sign-out, navigate to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error logging out: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: getMatch.when(
          data: (matches){
            if(matches.isEmpty){
              return const Text("No matches, add a match to start.");
            }
            return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 7.0),itemCount: matches.length, itemBuilder: (context, index){
              final match = matches[index];
              return GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder) => MatchScreen(match_id: match.id, team_id: team_id,)));
              },child: Container(decoration: BoxDecoration(border: Border.all(color: CupertinoColors.inactiveGray, width: 4), borderRadius: const BorderRadius.all(Radius.circular(30.0))), child: Container(alignment: Alignment.center,child: Text(match.title, style: const TextStyle(fontSize: 25),),)),);
            });
          },
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()))

    );
  }
}

void ReplaceValues(name) {
  comp_name = name;
}
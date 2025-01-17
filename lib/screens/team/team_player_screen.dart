import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/player/player_profile_screen.dart';
import 'package:football_coach_app/screens/team/add_player_to_team_screen.dart';
import 'package:football_coach_app/screens/team/create_team_screen.dart';
import 'package:football_coach_app/screens/team/team_screen.dart';
import '../../providers/player_provider.dart';
import '../../widgets/default_appbar.dart';
import '../auth/login_screen.dart'; // Your login screen

var teamname = "";
var teamdesc = "";

class TeamPlayerScreen extends ConsumerWidget {
  const TeamPlayerScreen({super.key, required this.team_id});

  final int? team_id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final getTeam = ref.watch(getTeamByIdProvider(team_id!));
    final playerService = ref.watch(playerListByTeamIdProvider(team_id!));

    getTeam.when(data: (team)  => ReplaceValues(team.name, team.description), error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: DefaultAppbar(title: "Team $teamname players"),
      body: Column(children: [
        playerService.when(data: (players) {
          if (players.isEmpty) {
            return const Center(child: Text("No teams created yet."));
          }
          return Expanded(child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index){
              final player = players[index];
              return Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                decoration: BoxDecoration(border: Border.all(color: CupertinoColors.inactiveGray, width: 1.5), borderRadius: BorderRadius.all(Radius.circular(60))),
                child: ListTile(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>PlayerProfileScreen(player_id: player.id))),
                  title: Text("${player.first_name} ${player.last_name}", style: TextStyle(fontSize: 15),),
                  subtitle: Text("${player.position} ${player.competition_type} ${player.country}", style: const TextStyle(fontSize: 13),),
                ),
              );
            },
          ),);
        }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()))
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPlayerToTeamScreen(team_id: team_id,)))
              .then((_) {
            // Refresh the team list after returning from CreateTeamScreen
            ref.invalidate(teamListProvider);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  void ReplaceValues(String name, String desc){
    teamname = name;
    teamdesc = desc;
  }
}
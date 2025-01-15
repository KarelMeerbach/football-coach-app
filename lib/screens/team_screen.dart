import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/competition_provider.dart';
import 'package:football_coach_app/providers/player_provider.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/dashboard_screen.dart';
import 'package:football_coach_app/screens/edit_team_screen.dart';
import 'package:football_coach_app/screens/team_competition_screen.dart';
import 'package:football_coach_app/screens/team_player_screen.dart';

var teamname = "";
var teamdesc = "";

class TeamScreen extends ConsumerWidget{
  const TeamScreen({super.key, required this.id});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeam = ref.watch(getTeamByIdProvider(id!));
    final playerService = ref.watch(playerListByTeamIdProvider(id!));
    final compService = ref.watch(getCompetitionListByTeamIdProvider(id!));



    getTeam.when(data: (team)  => ReplaceValues(team.name, team.description), error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));


    return Scaffold(
      appBar: AppBar(title: Text(teamname), actions: [
        PopupMenuButton(itemBuilder: (context)=> [
          const PopupMenuItem(value: 1,child: Text("Edit Team"),),
          const PopupMenuItem(value: 2,child: Text("DELETE Team"),)
        ],
        onSelected: (value) {
          if(value == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditTeamScreen(id: id,)));
          }else if (value == 2){
            showDialog(context: context, builder: (context) => AlertDialog(title: Text("DELETE TEAM?"),
            content: Text("Are you sure you want to delete team name: $teamname"),
            actions: [
              TextButton(onPressed: () {Navigator.pop(context);}, child: const Text("Cancel")),
              TextButton(onPressed: () {
                ref.read(deleteTeamByIdProvider(id!));
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
              }, child: const Text("Confirm"))
            ],));
          }
        },)
      ],),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints){
        return Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30),
              child: const Text("Team Description:"),
            ),
            const SizedBox(height: 5),
            Container(
              height: constraints.maxHeight / 15,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.inactiveGray, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(teamdesc),
              ),
            ),
            const SizedBox(height: 2),
            Container(alignment: Alignment.centerLeft, margin: EdgeInsets.only(left: 30),child: const Text("Players: "),),
            const SizedBox(height: 2),
            GestureDetector(child: Container(
                height: constraints.maxHeight / 3.2,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(children: [
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
                            title: Text("${player.first_name} ${player.last_name}", style: TextStyle(fontSize: 15),),
                            subtitle: Text("${player.position} ${player.competition_type} ${player.country}", style: const TextStyle(fontSize: 13),),
                          ),
                        );
                      },
                    ),);
                  }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()))
                ],)
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TeamPlayerScreen(team_id: id)));
            },
            ),

            const SizedBox(height: 5),
            Container(alignment: Alignment.centerLeft, margin: EdgeInsets.only(left: 30),child: const Text("Competitions: "),),
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TeamCompetitionScreen(team_id: id)));
            },child: Container(
                height: constraints.maxHeight / 3.2,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(children: [
                compService.when(data: (comps) {
                  if (comps.isEmpty) {
                    return const Center(child: Text("No competitions created yet."));
                  }
                  return Expanded(child: ListView.builder(
                    itemCount: comps.length,
                    itemBuilder: (context, index){
                      final comp = comps[index];
                      return Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(border: Border.all(color: CupertinoColors.inactiveGray, width: 1.5), borderRadius: BorderRadius.all(Radius.circular(60))),
                        child: ListTile(
                          title: Text("${comp.name}", style: TextStyle(fontSize: 15),),
                          subtitle: Text("${comp.competition_type} ${comp.createdAt}", style: const TextStyle(fontSize: 13),),
                        ),
                      );
                    },
                  ),);
                }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()))
              ],)
            ),
            )
          ],
        );
      }),
    );
  }

  void ReplaceValues(String name, String desc){
    teamname = name;
    teamdesc = desc;
  }
}
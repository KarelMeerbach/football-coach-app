import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/dashboard_screen.dart';
import 'package:football_coach_app/screens/edit_team_screen.dart';

var teamname = "";
var teamdesc = "";

class TeamScreen extends ConsumerWidget{
  const TeamScreen({super.key, required this.id});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeam = ref.watch(getTeamByIdProvider(id!));



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
            const SizedBox(height: 5),
            Container(
              height: constraints.maxHeight / 3.2,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.inactiveGray, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0)
            ),
            const SizedBox(height: 5),
            Container(
              height: constraints.maxHeight / 3.2,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.inactiveGray, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0)
            ),
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
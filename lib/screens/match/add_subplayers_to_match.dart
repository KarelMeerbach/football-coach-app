import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/player_in_match_model.dart';
import 'package:football_coach_app/providers/player_in_match_provider.dart';
import 'package:football_coach_app/providers/player_provider.dart';
import 'package:football_coach_app/enums/ERole.dart';
import 'package:football_coach_app/screens/match/add_subplayers_to_match.dart';
import 'package:football_coach_app/screens/match/match_screen.dart';

import '../../models/player_model.dart';
import '../../widgets/default_appbar.dart';




Set<String> playerSet = {};

class AddSubPlayersToMatch extends ConsumerWidget{
  AddSubPlayersToMatch({super.key, required this.match_id, required this.team_id, required this.playersList, required this.starterList});


  final int? team_id;
  final int? match_id;
  List<Player> playersList;
  List<PlayerInMatch> starterList;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    playerSet.clear();

    return Scaffold(
        appBar: DefaultAppbar(title: "Add subs"),
        body: Column(children: [
          PlayerListBuild(playersList),
          ElevatedButton(onPressed: (){
            var startingPlayers = playerSet;
            List<PlayerInMatch> playersInMatch = [];
            for(var starter in startingPlayers){
              playersInMatch.add(PlayerInMatch(id: null, player_id: int.parse(starter), match_id: match_id!, minutes_played: null, starting_position: null, alternative_position: null, role: Role.substitute.name));
            }

            List<Player> newList = [];
            for(var player in playersList){
              for(var playerNew in startingPlayers){
                if(player.id == int.parse(playerNew)){
                  newList.add(player);
                }
              }
            }

            try{
              ref.read(insertPlayerIntoMatchProvider(starterList));
              ref.read(insertPlayerIntoMatchProvider(playersInMatch));
            }catch(err){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $err')),);
            }
            ref.invalidate(getAllStartingPlayersInMatchProvider);
            ref.invalidate(getAllSubPlayersInMatchProvider);

            Navigator.push(context, MaterialPageRoute(builder: (builder)=>MatchScreen(match_id: match_id, team_id: team_id)));

          }, child: Text("Add Players to the Sub Lineup")),
          const SizedBox(height: 50,)
        ],)
    );
  }
}

class PlayerListBuild  extends StatefulWidget {
  PlayerListBuild(this.playersList, {super.key});
  List<Player> playersList;

  @override
  State<PlayerListBuild> createState() => _PlayerListBuild(playersList);
}

class _PlayerListBuild extends State<PlayerListBuild> {
  _PlayerListBuild(this.playersList);
  final List<Player> playersList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(itemBuilder: (context, index){
          final player = playersList[index];
          return ListTile(title: Text(player.first_name), onTap: (){setState(() {
            if(playerSet.contains(player.id.toString())){
              playerSet.remove(player.id.toString());
            }else{
              playerSet.add(player.id.toString());
            }});}, selected: playerSet.contains(player.id.toString()), selectedTileColor: Colors.blue.withOpacity(0.5),);
        }, itemCount: playersList.length,));
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/player_in_match_model.dart';
import 'package:football_coach_app/providers/player_in_match_provider.dart';
import 'package:football_coach_app/providers/player_provider.dart';
import 'package:football_coach_app/enums/ERole.dart';
import 'package:football_coach_app/screens/match/add_subplayers_to_match.dart';

import '../../models/player_model.dart';
import '../../widgets/default_appbar.dart';


List<Player> playersList = [];

Set<String> playerSet = {};

class AddPlayersToMatch extends ConsumerWidget{
  AddPlayersToMatch({super.key, required this.match_id, required this.team_id});


  final int? team_id;
  final int? match_id;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    playerSet.clear();

    var players = ref.watch(playerListByTeamIdProvider(team_id!));
    
    players.when(data: (players){
      playersList = players;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: DefaultAppbar(title: "Add the starting eleven"),
      body: Column(children: [
        PlayerListBuild(),
        ElevatedButton(onPressed: (){
          var startingPlayers = playerSet;
          List<PlayerInMatch> playersInMatch = [];
          for(var starter in startingPlayers){
            playersInMatch.add(PlayerInMatch(id: null, player_id: int.parse(starter), match_id: match_id!, minutes_played: null, starting_position: null, alternative_position: null, role: Role.starter.name));
          }

          List<Player> newList = [];
          for(var player in playersList){
            if(!startingPlayers.contains(player.id.toString())){
              newList.add(player);
            }
          }


          Navigator.push(context, MaterialPageRoute(builder: (builder) => AddSubPlayersToMatch(match_id: match_id, team_id: team_id, playersList: newList, starterList: playersInMatch,)));

        }, child: Text("Add Players to the Starting Lineup")),
        const SizedBox(height: 50,)
      ],)
    );
  }
}

class PlayerListBuild  extends StatefulWidget {
  const PlayerListBuild({super.key});

  @override
  State<PlayerListBuild> createState() => _PlayerListBuild();
}

class _PlayerListBuild extends State<PlayerListBuild> {
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

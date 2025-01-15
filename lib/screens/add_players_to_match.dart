import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/player_in_match_model.dart';
import 'package:football_coach_app/providers/player_in_match_provider.dart';
import 'package:football_coach_app/providers/player_provider.dart';
import 'package:football_coach_app/enums/ERole.dart';

import '../models/player_model.dart';




class AddPlayersToMatch extends ConsumerWidget{
  AddPlayersToMatch({super.key, required this.match_id, required this.team_id});


  final MultiSelectController<String> _controller = MultiSelectController();

  final int? team_id;
  final int? match_id;

  List<Player> playersList = [];



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var players = ref.watch(playerListByTeamIdProvider(team_id!));
    
    players.when(data: (players){
      playersList = players;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(title: Text("Add the starting eleven"),),
      body: Column(children: [
        Expanded(
          child: MultiSelectCheckList(
              items: List.generate(playersList.length, (index) => CheckListCard(
                  value: playersList[index].id,
                  title: Text(playersList[index].first_name + " " + playersList[index].last_name),
                  subtitle: Text(playersList[index].competition_type + " " + playersList[index].position)
              )),
              onChange: (allSelectedItems, selectedItem) {}),
        ),
        ElevatedButton(onPressed: (){
          var startingPlayers = _controller.getSelectedItems();
          List<PlayerInMatch> playersInMatch = [];
          for(var starter in startingPlayers){
            playersInMatch.add(PlayerInMatch(id: null, player_id: int.parse(starter), match_id: match_id!, minutes_played: null, starting_position: null, alternative_position: null, role: Role.starter.name));
          }

          List<Player> newList = [];
          for(var player in playersList){
            for(var playerNew in startingPlayers){
              if(player.id == int.parse(playerNew)){
                newList.add(player);
              }
            }
          }

          ref.watch(insertPlayerIntoMatchProvider(playersInMatch));

        }, child: Text("Add Players to the Starting Lineup")),
        const SizedBox(height: 50,)
      ],)
    );
  }
}
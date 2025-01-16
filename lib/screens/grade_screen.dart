import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/grade_category_model.dart';
import 'package:football_coach_app/models/player_grade_model.dart';
import 'package:football_coach_app/models/player_in_match_model.dart';
import 'package:football_coach_app/providers/grade_category_provider.dart';
import 'package:football_coach_app/providers/grade_provider.dart';
import 'package:football_coach_app/providers/match_provider.dart';
import 'package:football_coach_app/providers/player_in_match_provider.dart';
import 'package:football_coach_app/providers/team_provider.dart';

import '../models/player_model.dart';

List<Player> playerList = [];
List<GradeCategory> gradeCategories = [];
List<PlayerInMatch> playersInMatchList = [];
int playerIndex = 0;
int maxIndex = 0;
List<PlayerGrade> gradeValues = [];
int matchId = 0;


class GradeScreen extends ConsumerWidget{
  GradeScreen({super.key, required this.match_id});
  final int? match_id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    matchId = match_id!;
    var firebase = FirebaseAuth.instance.currentUser?.uid;
    var getPlayers = ref.watch(getAllPlayersInMatchProvider(match_id!));
    var getCategories = ref.watch(getGradeCategoryByCreatorProvider(firebase!));
    var getPlayersInMatch = ref.watch(getAllPlayersInMatchInMatchProvider(match_id!));


    getPlayers.when(data: (players){
      playerList = players;
      maxIndex = playerList.length;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    getCategories.when(data: (categories){
      gradeCategories = categories;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    getPlayersInMatch.when(data: (playerInMatch){
      playersInMatchList = playerInMatch;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    if(gradeValues.isEmpty){
      for(var player in playerList){
        for(var cat in gradeCategories){
          gradeValues.add(PlayerGrade(id: null, player_in_match_id: playersInMatchList.where((x) => x.player_id == player.id).single.id!, category_id: cat.id!, grade_value: 0));
        }
      }
    }
    if(playerIndex == maxIndex - 1){
    }

    return Scaffold(
      appBar: AppBar(title: Text("Player Grading"),),
      body: GradeBody(),
    );
  }
}

class GradeBody extends ConsumerStatefulWidget {
  const GradeBody({super.key});

  @override
  _GradeBodyState createState() => _GradeBodyState();
}

class _GradeBodyState extends ConsumerState<GradeBody> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints){
      return Column(children: [
        Container(alignment: Alignment.center,child: Text("${playerList[playerIndex].first_name} ${playerList[playerIndex].last_name}", style: TextStyle(fontSize: 30),),),
        Container(alignment: Alignment.center,child: Text("${playerList[playerIndex].position}, ${playerList[playerIndex].birthdate.year}", style: TextStyle(fontSize: 20, color: CupertinoColors.inactiveGray),),),
        SizedBox(height: 30,),
        Expanded(child:
        ListView.builder(itemBuilder: (context, index){
          final category = gradeCategories[index];
          return Column(children: [
            Container(child: Text(category.category_name, style: TextStyle(fontSize: 30),), alignment: Alignment.center,),
            SizedBox(height: 10,),
            Row(children: [
              for (var i = 1; i < 11; i++)
                Expanded(child: Column(children: [
                  Radio(value: i, groupValue: gradeValues.where((x) => x.player_in_match_id == getPlayerInMatchByPlayerId(playerList[playerIndex].id)!.id && x.category_id == category.id).single.grade_value, onChanged: (value){
                    setState(() {
                      gradeValues.where((x) => x.player_in_match_id == getPlayerInMatchByPlayerId(playerList[playerIndex].id)!.id && x.category_id == category.id).single.grade_value = value!;
                    });
                  }),
                  Text(i.toString())
                ],),)
            ],)
          ],);
        }, itemCount: gradeCategories.length) ,),
        Row(children: [
          Container(width: constraints.maxWidth / 2, child: ElevatedButton(onPressed: (){
            setState(() {
              if(playerIndex > 0){

                playerIndex--;
              }
            });
          }, child: Text("Left")),),
          Container(width: constraints.maxWidth / 2, child:
          ElevatedButton(onPressed: (){
            setState(() {

              if(playerIndex == maxIndex - 1){
                try{
                  ref.read(insertGradeInBulkProvider(gradeValues));
                  ref.read(finishMatchByIdProvider(matchId));
                  ref.invalidate(getMatchByIdProvider(matchId));

                  Navigator.pop(context);
                }catch(err){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $err')),);
                }
              }else if(playerIndex < maxIndex - 1){
                playerIndex++;
              }
            });
          }, child: playerIndex == maxIndex - 1 ?  Text("Finish"): Text("Right"))
          )

        ],)
      ],);
    });
    
  }
}


PlayerInMatch? getPlayerInMatchByPlayerId(var playerId){
  for(var playerinmatch in playersInMatchList){
    if(playerinmatch.player_id == playerId){
      return playerinmatch;
    }
  }
  return null;
}


import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/grade_category_model.dart';
import 'package:football_coach_app/providers/grade_category_provider.dart';
import 'package:football_coach_app/providers/player_in_match_provider.dart';

import '../models/player_model.dart';

List<Player> playerList = [];
List<GradeCategory> gradeCategories = [];
int playerIndex = 0;
int maxIndex = 0;
List<int> gradeValues = [];

class GradeScreen extends ConsumerWidget{
  GradeScreen({super.key, required this.match_id});
  final int? match_id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var firebase = FirebaseAuth.instance.currentUser?.uid;
    var getPlayers = ref.watch(getAllPlayersInMatchProvider(match_id!));
    var getCategories = ref.watch(getGradeCategoryByCreatorProvider(firebase!));


    getPlayers.when(data: (players){
      playerList = players;
      maxIndex = playerList.length;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    getCategories.when(data: (categories){
      gradeCategories = categories;
      if(gradeValues.isEmpty){
        for(var cat in gradeCategories){
          gradeValues.add(0);
        }
      }
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));


    log(gradeValues.toString());

    return Scaffold(
      appBar: AppBar(title: Text("Player Grading"),),
      body: GradeBody(),
    );
  }
}

class GradeBody extends StatefulWidget {
  const GradeBody({super.key});

  @override
  State<GradeBody> createState() => _GradeBodyState();
}

class _GradeBodyState extends State<GradeBody> {
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
                  Radio(value: i, groupValue: gradeValues[index], onChanged: (int? value){
                    setState(() {
                      gradeValues[index] = value!;
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
          Container(width: constraints.maxWidth / 2, child: ElevatedButton(onPressed: (){
            setState(() {
              if(playerIndex <= maxIndex){
                playerIndex++;
              }
            });
          }, child: Text("Right")))

        ],)
      ],);
    });
    
  }

}


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/grade_category_model.dart';
import 'package:football_coach_app/models/player_grade_model.dart';
import 'package:football_coach_app/providers/grade_provider.dart';
import 'package:football_coach_app/providers/player_provider.dart';

var player_name = "";
var player_lastname = "";

List<PlayerGrade> gradeList = [];
List<DateTime> matchDates = [];
List<String> gradeCategories = [];

class PlayerProfileScreen extends ConsumerWidget{
  PlayerProfileScreen({super.key, required this.player_id});
  int? player_id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var playerGet = ref.watch(getPlayerByidProvider(player_id!));
    var gradeGet = ref.watch(getPlayerGradesByPlayerIdProvider(player_id!));

    playerGet.when(data: (data){
      player_name = data.first_name;
      player_lastname = data.last_name;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    gradeGet.when(data: (data){
      gradeList = data;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    for(var grade in gradeList){
      ref.watch(getGradeMatchDateProvider(grade)).
      when(data: (data){
      matchDates.add(data);
      }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));
    }

    for(var grade in gradeList){
      ref.watch(getGradeCategoryNameProvider(grade)).
      when(data: (data){
        gradeCategories.add(data);
      }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));
    }

    final categoryColors = {
      for (var i = 0; i < gradeCategories.length; i++) gradeCategories[i]: Colors.primaries[i % Colors.primaries.length],
    };



    return LayoutBuilder(builder: (context, BoxConstraints constraints){
      return Scaffold(
        appBar: AppBar(title: Text(player_name + " " + player_lastname)),
        body: Column(children: [
          Container(height: constraints.maxHeight /3,),
          Container(height: constraints.maxHeight /3,),
        ],),
      );
    });
  }
}
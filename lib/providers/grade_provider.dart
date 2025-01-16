import 'dart:developer';

import 'package:football_coach_app/models/grade_category_model.dart';
import 'package:football_coach_app/models/player_grade_model.dart';
import 'package:football_coach_app/models/player_in_match_model.dart';
import 'package:football_coach_app/models/match_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'grade_provider.g.dart';

@riverpod
Future<void> insertGradeInBulk(ref, List<PlayerGrade> grades) async {
  final supabase = Supabase.instance.client;


  var maps = [];

  for(var grade in grades){
    maps.add(grade.toMap());
  }

  try {
    log(maps.toString());
    final data = await supabase.from("playergrades").insert(maps);

    if (data.isEmpty() || data == null) {
      throw Exception('Failed to create team');
    }

    return;
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<List<PlayerGrade>> getPlayerGradesByPlayerId(ref, int id) async {
  final supabase = Supabase.instance.client;
  try{
    final data = await supabase.from("playergrades").select().eq("player_id", id);

    return (data as List<dynamic>).map((match) => PlayerGrade.fromMap(match)).toList();
  }catch(err){
    throw Exception(err);
  }
}

@riverpod
Future<DateTime> getGradeMatchDate(ref, PlayerGrade grade) async {
  final supabase = Supabase.instance.client;
  var playerInMatch_id = grade.player_in_match_id;

  try{
    final data = supabase.from("playerinmatch").select().eq("id", playerInMatch_id).single();

    int match_id = PlayerInMatch.fromMap(data as Map<String, dynamic>).match_id;

    final response = supabase.from("matches").select().eq("id", match_id).single();

    return Match.fromMap(response as Map<String, dynamic>).match_date;
  }catch(err){
    throw Exception(err);
  }
}

@riverpod
Future<String> getGradeCategoryName(ref, PlayerGrade grade) async {
  final supabase = Supabase.instance.client;
  var cat_id = grade.category_id;

  try{
    final data = supabase.from("gradecategories").select().eq("id", cat_id).single();

    return GradeCategory.fromMap(data as Map<String, dynamic>).category_name;
  }catch(err){
    throw Exception(err);
  }

}
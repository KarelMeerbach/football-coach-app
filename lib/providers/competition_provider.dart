import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/competition_model.dart';
import 'package:football_coach_app/models/player_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/team_model.dart';

part 'competition_provider.g.dart';

@riverpod
Future<List<Competition>> getCompetitionListByTeamId(ref, int team_id) async {
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('competitions')
        .select()
        .eq('team_id', team_id)
        .order('created_at', ascending: false);


    return (data as List<dynamic>).map((competition) => Competition.fromMap(competition)).toList();
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<Competition> getCompetitionById(ref, int comp_id) async{
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('competitions')
        .select()
        .eq('id', comp_id)
        .single();

    return Competition.fromMap(data);
  } catch (error) {
    throw Exception('Error fetching comp: $error');
  }
}

@riverpod
Future<void> insertCompetition(ref, Competition competition) async{
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('competitions')
        .insert(competition.toMap())
        .select();

    return;
  } catch (error) {
    throw Exception('Error fetching comp: $error');
  }
}
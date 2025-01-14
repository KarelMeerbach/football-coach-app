import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/team_model.dart';

part 'team_provider.g.dart';

@riverpod
Future<List<Team>> teamList(ref) async {
  final supabase = Supabase.instance.client;
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    throw Exception("User not logged in");
  }

  try {
    final data = await supabase
        .from('teams')
        .select()
        .eq('created_by', firebaseUser.uid)
        .order('created_at', ascending: false);


    return (data as List<dynamic>).map((team) => Team.fromMap(team)).toList();
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<void> createTeam(ref, String inputname, String inputdescription) async {
  final supabase = Supabase.instance.client;
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    throw Exception("User not logged in");
  }

  try {


    Team newteam = Team(id: null,name: inputname, description: inputdescription, createdBy: firebaseUser.uid, createdAt: DateTime.now());


    final response = await supabase.from('teams').insert(newteam.toMap());

    if (response.isEmpty() || response == null) {
      throw Exception('Failed to create team');
    }

    ref.invalidate(teamListProvider);


  } catch (error) {
    throw Exception('Error creating team: $error');
  }
}

@riverpod
Future<Team> getTeamById(ref, int teamId) async {
  final supabase = Supabase.instance.client;

  try{
    final response = await supabase.from('teams').select().eq('id', teamId).single();

    return Team.fromMap(response);
  }catch(error){
    throw Exception('Error getting team: $error');
  }
}

@riverpod
Future<void> updateTeamById(ref, int teamId, String teamname, String teamdesc) async {
  final supabase = Supabase.instance.client;

  try{
    final response = await supabase.from('teams').update({"name": teamname, "description": teamdesc}).eq('id', teamId);

    ref.invalidate(teamListProvider);
    ref.invalidate(getTeamByIdProvider);

    return;
  }catch(error){
    throw Exception('Error updating team: $error');
  }
}

@riverpod
Future<void> deleteTeamById(ref, int teamId) async {
  final supabase = Supabase.instance.client;

  try{
    final response = await supabase.from("teams").delete().eq("id", teamId);

    ref.invalidate(teamListProvider);

    return;

  }catch(err){
    throw Exception("error deleting team: $err");
  }
}


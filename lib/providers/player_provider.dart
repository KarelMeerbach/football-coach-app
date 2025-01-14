import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/player_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/team_model.dart';

part 'player_provider.g.dart';

@riverpod
Future<List<Player>> playerListByTeamId(ref, int team_id) async {
  final supabase = Supabase.instance.client;
  final firebaseUser = FirebaseAuth.instance.currentUser;

  if (firebaseUser == null) {
    throw Exception("User not logged in");
  }

  try {
    final data = await supabase
        .from('players')
        .select()
        .eq('team_id', team_id)
        .order('created_at', ascending: false);


    return (data as List<dynamic>).map((player) => Player.fromMap(player)).toList();
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<void> addPlayerToTeam(ref, Player player) async {
  final supabase = Supabase.instance.client;

  try{
    final response = await supabase.from('players').insert(player.toMap());

    ref.invalidate(playerListByTeamIdProvider);
  }catch(err){
    throw Exception("Failed to create player: $err");
  }
}
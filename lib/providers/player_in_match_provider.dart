import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/player_in_match_model.dart';
import 'package:football_coach_app/models/player_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/team_model.dart';

part 'player_in_match_provider.g.dart';

@riverpod
Future<void> insertPlayerIntoMatch(ref, List<PlayerInMatch> playersInMatch) async {
  final supabase = Supabase.instance.client;
  var maps = [];

  for(var player in playersInMatch){
    var map = player.toMap();
    maps.add(map);
  }

  try {
    final data = await supabase
        .from('playerinmatch')
        .insert(maps);

    return;

  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<List<Player>> getAllStartingPlayersInMatch(ref, int match_id) async{
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('playerinmatch')
        .select('player_id').eq("role", "starter").eq("match_id", match_id);

    var ids = data.toList();
    
    var ids_strings = [];

    for(var id in ids){
      ids_strings.add(int.parse(id["player_id"].toString()));
    }

    if(ids_strings.isEmpty){
      return [];
    }

    final response = await supabase.from('players').select().inFilter('id', ids_strings);

    return (response as List<dynamic>).map((player) => Player.fromMap(player)).toList();

  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<List<Player>> getAllPlayersInMatch(ref, int match_id) async{
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('playerinmatch')
        .select('player_id').eq("match_id", match_id).order("role", ascending: true);

    var ids = data.toList();



    var ids_strings = [];

    for(var id in ids){
      ids_strings.add(int.parse(id["player_id"].toString()));
    }

    if(ids_strings.isEmpty){
      return [];
    }

    final response = await supabase.from('players').select().inFilter('id', ids_strings);

    return (response as List<dynamic>).map((player) => Player.fromMap(player)).toList();

  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<List<PlayerInMatch>> getAllPlayersInMatchInMatch(ref, int match_id) async{
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('playerinmatch')
        .select().eq("match_id", match_id).order("role", ascending: true);

    return (data as List<dynamic>).map((player) => PlayerInMatch.fromMap(player)).toList();

  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<List<Player>> getAllSubPlayersInMatch(ref, int match_id) async{
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('playerinmatch')
        .select('player_id').eq("role", "substitute").eq("match_id", match_id);

    var ids = data.toList();

    var ids_strings = [];

    for(var id in ids){
      ids_strings.add(int.parse(id["player_id"].toString()));
    }

    if(ids_strings.isEmpty){
      return [];
    }

    final response = await supabase.from('players').select().inFilter("id", ids_strings);

    return (response as List<dynamic>).map((player) => Player.fromMap(player)).toList();

  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

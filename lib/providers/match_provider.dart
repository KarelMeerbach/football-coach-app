import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:football_coach_app/models/match_model.dart';

part 'match_provider.g.dart';

@riverpod
Future<List<Match>> getMatchesFromCompetitionId(ref, int comp_id) async {
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('matches')
        .select()
        .eq('competition_id', comp_id)
        .order('created_at', ascending: false);


    return (data as List<dynamic>).map((match) => Match.fromMap(match)).toList();
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<Match> getMatchById(ref, int match_id) async {
  final supabase = Supabase.instance.client;
  try {
    final data = await supabase
        .from('matches')
        .select()
        .eq('id', match_id)
        .single();


    return Match.fromMap(data);
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}

@riverpod
Future<void> finishMatchById(ref, int match_id) async {
  final supabase = Supabase.instance.client;
  try {
    final data = await supabase.from("matches").update({"finish": true}).eq("id", match_id);

    return;
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}
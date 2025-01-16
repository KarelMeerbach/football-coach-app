import 'dart:developer';

import 'package:football_coach_app/models/competition_model.dart';
import 'package:football_coach_app/models/grade_category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'grade_category_provider.g.dart';

@riverpod
Future<List<GradeCategory>> getGradeCategoryByCreator(ref, String id) async {
  final supabase = Supabase.instance.client;

  try {
    final data = await supabase
        .from('gradecategories')
        .select()
        .eq('created_by', id);


    return (data as List<dynamic>).map((gradeCategory) => GradeCategory.fromMap(gradeCategory)).toList();
  } catch (error) {
    throw Exception('Error fetching teams: $error');
  }
}
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/models/chart_grade_model.dart';
import 'package:football_coach_app/models/grade_category_model.dart';
import 'package:football_coach_app/models/player_grade_model.dart';
import 'package:football_coach_app/providers/grade_provider.dart';
import 'package:football_coach_app/providers/player_provider.dart';

import '../widgets/default_appbar.dart';

var player_name = "";
var player_lastname = "";
var player_position = "";
var birthdate = DateTime(0000);


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
      player_position = data.position;
      birthdate = data.birthdate;
    }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));

    List<ChartGrade> chartGrades = [];

    return LayoutBuilder(builder: (context, BoxConstraints constraints){
      return Scaffold(
          appBar: DefaultAppbar(title: player_name + " " + player_lastname),//appBar: AppBar(title: Text(player_name + " " + player_lastname)),
        body: gradeGet.when(data: (grades){
          for(var grade in grades){
            ref.watch(getGradeCategoryNameProvider(grade)).when(data: (cat){
              ref.watch(getGradeMatchDateProvider(grade)).when(data: (time){
                chartGrades.add(ChartGrade(gradeCategory: cat, matchTime: time, grade_value: int.parse(grade.grade_value.toString())));
              }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));
            }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));
          }

          final Map<String, List<ChartGrade>> gradesByCategory = {};
          for (var chartgrade in chartGrades) {
            gradesByCategory.putIfAbsent(chartgrade.gradeCategory, () => []).add(chartgrade);
          }

          final uniqueDates = chartGrades.map((g) => g.matchTime).toSet().toList()..sort();

          final categoryColors = {
            for (var i = 0; i < gradesByCategory.keys.length; i++)
              gradesByCategory.keys.elementAt(i): Colors.primaries[i % Colors.primaries.length],
          };

          final List<LineChartBarData> lineBarsData = gradesByCategory.entries.map((entry) {
            final category = entry.key;
            final grades = entry.value;

            return LineChartBarData(
              spots: grades.map((grade) {
                double x = uniqueDates.indexOf(grade.matchTime).toDouble();
                return FlSpot(x, grade.grade_value.toDouble());
              }).toList(),
              isCurved: false,
              color: categoryColors[category],
              barWidth: 3,
              dotData: FlDotData(show: true),
            );
          }).toList();



          return Column(children: [
            Container(height: constraints.maxHeight /3, child: Text("Position: $player_position | Birthdate: ${birthdate.year}/${birthdate.month}", style: TextStyle(fontSize: 20),)),
            Container(height: constraints.maxHeight /5,),
            Text("Player statistics per match:"),
            Expanded(child: Container(width: constraints.maxWidth * 0.9, child: LineChart(LineChartData(
                minY: 0,
                maxY: 10,
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta){
                          if(value.toInt() < uniqueDates.length){
                            final date = uniqueDates[value.toInt()];
                            return Text("${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
                                style: const TextStyle(fontSize: 16));
                          }
                          return Text("");
                        }
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
                    ),
                  ),
                ),
                lineBarsData: lineBarsData
            )
            ),
            ),
            ),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: categoryColors.entries.map((entry) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: entry.value,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(entry.key, style: const TextStyle(fontSize: 14)),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 30,)
          ],);
        }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()))

      );
    });
  }
}
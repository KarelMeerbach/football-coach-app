import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/competition_provider.dart';
import 'package:football_coach_app/providers/match_provider.dart';
import 'package:football_coach_app/screens/match/match_screen.dart';
import '../../widgets/default_appbar.dart';
import '../auth/login_screen.dart';

String comp_name = "";

class CompetitionScreen extends ConsumerWidget {
  const CompetitionScreen({super.key, required this.comp_id, required this.team_id});

  final int? team_id;
  final int? comp_id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeam = ref.watch(getCompetitionByIdProvider(comp_id!));
    final getMatch = ref.watch(getMatchesFromCompetitionIdProvider(comp_id!));

    getTeam.when(
      data: (comp) => ReplaceValues(comp.name),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );

    final theme = Theme.of(context); // Get current theme

    return Scaffold(
      appBar: DefaultAppbar(title: comp_name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: getMatch.when(
          data: (matches) {
            if (matches.isEmpty) {
              return const Center(child: Text("No matches, add a match to start."));
            }
            return _buildMatchGrid(context, matches, theme);
          },
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  /// 🔹 Build the GridView of Matches
  Widget _buildMatchGrid(BuildContext context, List matches, ThemeData theme) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 1.5, // Adjusts grid aspect ratio
      ),
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final match = matches[index];
        return _buildMatchCard(context, match, theme);
      },
    );
  }

  /// 🔹 Build a Card for Each Match with Modern Styling
  Widget _buildMatchCard(BuildContext context, match, ThemeData theme) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => MatchScreen(match_id: match.id, team_id: team_id),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor, // Using theme background color
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: theme.brightness == Brightness.light
                  ? Colors.black.withOpacity(0.1)
                  : Colors.white.withOpacity(0.1), // Dynamic shadow color
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              match.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.brightness == Brightness.light
                    ? Colors.black
                    : Colors.white, // Text color changes based on theme
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 Replace Competition Name (for title in app bar)
  void ReplaceValues(String name) {
    comp_name = name;
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_coach_app/models/team_model.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/competition/team_competition_screen.dart';

final mockTeam = Team(
  id: 1,
  name: 'Dream Team',
  description: 'Elite Squad',
  createdBy: 'Coach',
  createdAt: DateTime.now(),
);

void main() {
  group('TeamCompetitionScreen Tests', () {
    // Helper widget to build the UI with mock providers
    Widget createWidgetUnderTest({
      required FutureOr<Team> teamResponse,
    }) {
      return ProviderScope(
        overrides: [
          // Override the provider with a function returning a FutureOr<Team>
          getTeamByIdProvider(1).overrideWith((ref) => Future.value(teamResponse)),
        ],
        child: const MaterialApp(
          home: TeamCompetitionScreen(team_id: 1),
        ),
      );
    }

    testWidgets('Displays loading indicator when loading data', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        teamResponse: Future.delayed(const Duration(seconds: 1), () => mockTeam), // Simulate loading
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Displays error message when error occurs', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        teamResponse: Future.error('Failed to load team'), // Simulate error
      ));

      expect(find.textContaining('Error'), findsOneWidget);
    });

    testWidgets('Displays team name and description correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(
        teamResponse: mockTeam, // Directly passing the mock data as a Team object
      ));

      await tester.pump();

      // Check if team details are displayed correctly
      expect(find.text('Dream Team'), findsOneWidget);
      expect(find.text('Elite Squad'), findsOneWidget);
    });
  });
}

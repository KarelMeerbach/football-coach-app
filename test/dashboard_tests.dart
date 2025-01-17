import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_coach_app/screens/dashboard_screen.dart';
import 'package:football_coach_app/screens/team/create_team_screen.dart';
import 'package:football_coach_app/screens/team/team_screen.dart';
import 'package:football_coach_app/models/team_model.dart';
import 'package:football_coach_app/providers/team_provider.dart';

void main() {
  /// Helper widget to wrap the DashboardScreen with the mocked provider
  Widget createWidgetUnderTest(Future<List<Team>> Function(AutoDisposeFutureProviderRef<List<Team>>) mockProvider) {
    return ProviderScope(
      overrides: [
        teamListProvider.overrideWith(mockProvider),
      ],
      child: const MaterialApp(
        home: DashboardScreen(),
      ),
    );
  }

  group('DashboardScreen Tests', () {
    testWidgets('Displays loading indicator while loading', (WidgetTester tester) async {
      // Simulate a delay for loading state
      await tester.pumpWidget(createWidgetUnderTest((ref) async {
        await Future.delayed(const Duration(seconds: 1)); // Simulates loading
        return [];
      }));

      // Trigger the loading state
      await tester.pump();

      // Expect CircularProgressIndicator to be visible
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('No teams created yet.'), findsNothing);
    });

    testWidgets('Displays error message on error', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest((ref) async {
        throw Exception('Failed to load teams');
      }));

      await tester.pump();

      expect(find.text('Error: Exception: Failed to load teams'), findsOneWidget);
    });

    testWidgets('Displays "No teams created yet." when team list is empty', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest((ref) async => []));

      await tester.pump();

      expect(find.text('No teams created yet.'), findsOneWidget);
    });

    testWidgets('Displays list of teams when data is available', (WidgetTester tester) async {
      final mockTeams = [
        Team(id: 1, name: 'Team A', description: 'Description A', createdBy: 'user1', createdAt: DateTime.now()),
        Team(id: 2, name: 'Team B', description: 'Description B', createdBy: 'user2', createdAt: DateTime.now()),
      ];

      await tester.pumpWidget(createWidgetUnderTest((ref) async => mockTeams));

      await tester.pump();

      expect(find.text('Team A'), findsOneWidget);
      expect(find.text('Description A'), findsOneWidget);
      expect(find.text('Team B'), findsOneWidget);
      expect(find.text('Description B'), findsOneWidget);
    });

    testWidgets('Navigates to TeamScreen when a team is tapped', (WidgetTester tester) async {
      final mockTeams = [
        Team(id: 1, name: 'Team A', description: 'Description A', createdBy: 'user1', createdAt: DateTime.now()),
      ];

      await tester.pumpWidget(createWidgetUnderTest((ref) async => mockTeams));

      await tester.pump();

      await tester.tap(find.text('Team A'));
      await tester.pumpAndSettle();

      expect(find.byType(TeamScreen), findsOneWidget);
    });

    testWidgets('Navigates to CreateTeamScreen when FAB is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest((ref) async => []));

      await tester.pump();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(CreateTeamScreen), findsOneWidget);
    });
  });
}

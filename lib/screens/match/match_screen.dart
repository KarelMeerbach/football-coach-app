import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/match_provider.dart';
import 'package:football_coach_app/providers/player_in_match_provider.dart';
import 'package:football_coach_app/screens/match/add_players_to_match.dart';
import 'package:football_coach_app/screens/grade/grade_screen.dart';
import 'package:football_coach_app/screens/player/player_profile_screen.dart';
import '../../models/player_model.dart';
import '../../widgets/default_appbar.dart';
import '../auth/login_screen.dart';

String match_title = "";
bool? match_finished = false;
DateTime createdAt = DateTime(0000);

class MatchScreen extends ConsumerWidget {
  const MatchScreen({super.key, required this.match_id, required this.team_id});

  final int? team_id;
  final int? match_id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var getMatch = ref.watch(getMatchByIdProvider(match_id!));
    var getMatchStarters = ref.watch(getAllStartingPlayersInMatchProvider(match_id!));
    var getMatchSubs = ref.watch(getAllSubPlayersInMatchProvider(match_id!));

    getMatch.when(
      data: (match) => ReplaceValues(match.title, match.match_date, match.finsihed),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );

    return Scaffold(
      appBar: DefaultAppbar(title: match_title),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Text("Starters:"),
              Expanded(child: _buildPlayerListSection(getMatchStarters, 'No starters, add starters to begin', context),),
              const SizedBox(height: 10),
              Text("Subs:"),
              Expanded(child: _buildPlayerListSection(getMatchSubs, 'No subs, add starters to begin', context),),

              const SizedBox(height: 10),
              Expanded(child: _buildActionButtonsSection(constraints, context),)

            ],
          );
        },
      ),
    );
  }

  // Widget to display list of players (starters or subs)
  Widget _buildPlayerListSection(AsyncValue<List<Player>> playerList, String emptyMessage, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.inactiveGray),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            playerList.when(
              data: (players) => _buildPlayerList(players, context),
              error: (error, stackTrace) => Center(child: Text('Error: $error')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
            if (playerList.hasError) Center(child: Text(emptyMessage)),
          ],
        ),
      ),
    );
  }

  // ListView of players
  Widget _buildPlayerList(List<Player> players, BuildContext context) {
    if (players.isEmpty) {
      return const Center(child: Text('No players available.'));
    }

    return Flexible( // Using Flexible instead of Expanded to avoid unbounded height error
      child: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) => PlayerProfileScreen(player_id: player.id)),
              );
            },
            title: Text("${player.first_name} ${player.last_name}", style: const TextStyle(fontSize: 15)),
            subtitle: Text("${player.position} ${player.competition_type} ${player.country}", style: const TextStyle(fontSize: 13)),
          );
        },
      ),
    );
  }

  // Action buttons (Add Players / End Match)
  Widget _buildActionButtonsSection(BoxConstraints constraints, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.inactiveGray),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          height: constraints.maxHeight / 6.5, // Providing bounded height for the action buttons section
          child: match_finished == false
              ? Column(
            children: [
              _buildActionButton(constraints, "ADD PLAYERS", Colors.green, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => AddPlayersToMatch(match_id: match_id, team_id: team_id)),
                );
              }),
              const SizedBox(height: 10),
              _buildActionButton(constraints, "END MATCH", Colors.red, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => GradeScreen(match_id: match_id)),
                );
              }),
            ],
          )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  // Helper method to create action buttons
  Widget _buildActionButton(BoxConstraints constraints, String text, Color borderColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: constraints.maxWidth * 0.95,
        height: constraints.maxHeight / 6.5 / 2.5,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(45),
        ),
        alignment: Alignment.center,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

void ReplaceValues(String title, DateTime date, bool fin) {
  match_title = title;
  createdAt = date;
  match_finished = fin;
}

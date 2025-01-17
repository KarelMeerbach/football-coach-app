import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/competition_provider.dart';
import 'package:football_coach_app/providers/player_provider.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/dashboard_screen.dart';
import 'package:football_coach_app/screens/team/edit_team_screen.dart';
import 'package:football_coach_app/screens/competition/team_competition_screen.dart';
import 'package:football_coach_app/screens/team/team_player_screen.dart';

class TeamScreen extends ConsumerWidget {
  const TeamScreen({super.key, required this.id});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeam = ref.watch(getTeamByIdProvider(id!));
    final playerService = ref.watch(playerListByTeamIdProvider(id!));
    final compService = ref.watch(getCompetitionListByTeamIdProvider(id!));

    return getTeam.when(
      data: (team) => Scaffold(
        appBar: _buildAppBar(context, ref, team.name),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("Team Description"),
                    _buildDescriptionBox(team.description),
                    const SizedBox(height: 20),
                    _buildSectionWithBorder(
                      title: "Players",
                      child: _buildPlayerList(context, ref, playerService, constraints),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeamPlayerScreen(team_id: id)),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSectionWithBorder(
                      title: "Competitions",
                      child: _buildCompetitionList(context, ref, compService, constraints),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeamCompetitionScreen(team_id: id)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      error: (error, stackTrace) =>
          Center(child: Text('Error loading team: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  /// 🔹 AppBar with Popup Menu
  AppBar _buildAppBar(BuildContext context, WidgetRef ref, String name) {
    return AppBar(
      title: Text(name),
      actions: [
        PopupMenuButton<int>(
          onSelected: (value) {
            if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditTeamScreen(id: id)),
              );
            } else if (value == 2) {
              _showDeleteDialog(context, ref, id!, name);
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 1, child: Text("Edit Team")),
            PopupMenuItem(value: 2, child: Text("Delete Team")),
          ],
        )
      ],
    );
  }

  /// 🔹 Delete Confirmation Dialog
  void _showDeleteDialog(BuildContext context, WidgetRef ref, int id, String teamName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("DELETE TEAM?"),
        content: Text("Are you sure you want to delete the team: $teamName?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              ref.read(deleteTeamByIdProvider(id));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DashboardScreen()),
              );
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  /// 🔹 Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  /// 🔹 Description Box
  Widget _buildDescriptionBox(String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white10,
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        description,
        style: const TextStyle(fontSize: 16, color: Colors.blue),
      ),
    );
  }

  /// 🔹 Bordered Section Wrapper
  Widget _buildSectionWithBorder({required String title, required Widget child, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }

  /// 🔹 Player List
  Widget _buildPlayerList(BuildContext context, WidgetRef ref, AsyncValue<List> playerService, BoxConstraints constraints) {
    return playerService.when(
      data: (players) {
        if (players.isEmpty) {
          return const Center(child: Text("No players added yet."));
        }
        return SizedBox(
          height: constraints.maxHeight / 3.5,
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              return _buildPlayerCard(player);
            },
          ),
        );
      },
      error: (error, stackTrace) =>
          Center(child: Text('Error loading players: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  /// 🔹 Player Card
  Widget _buildPlayerCard(dynamic player) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text("${player.first_name} ${player.last_name}"),
        subtitle: Text("${player.position} • ${player.country}"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  /// 🔹 Competition List
  Widget _buildCompetitionList(BuildContext context, WidgetRef ref, AsyncValue<List> compService, BoxConstraints constraints) {
    return compService.when(
      data: (competitions) {
        if (competitions.isEmpty) {
          return const Center(child: Text("No competitions added yet."));
        }
        return SizedBox(
          height: constraints.maxHeight / 3.5,
          child: ListView.builder(
            itemCount: competitions.length,
            itemBuilder: (context, index) {
              final comp = competitions[index];
              return _buildCompetitionCard(comp);
            },
          ),
        );
      },
      error: (error, stackTrace) =>
          Center(child: Text('Error loading competitions: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  /// 🔹 Competition Card
  Widget _buildCompetitionCard(dynamic competition) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.emoji_events, color: Colors.amber),
        title: Text(competition.name),
      ),
    );
  }
}

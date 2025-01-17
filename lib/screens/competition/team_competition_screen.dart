import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/competition_provider.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/competition/create_competition_screen.dart';
import 'package:football_coach_app/screens/team/add_player_to_team_screen.dart';
import 'package:football_coach_app/screens/competition/competition_screen.dart';
import '../../widgets/default_appbar.dart';


var teamname = "";
var teamdesc = "";

class TeamCompetitionScreen extends ConsumerWidget {
  const TeamCompetitionScreen({super.key, required this.team_id});

  final int? team_id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getTeam = ref.watch(getTeamByIdProvider(team_id!));
    final competitionService = ref.watch(getCompetitionListByTeamIdProvider(team_id!));

    getTeam.when(
      data: (team) => ReplaceValues(team.name, team.description),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );

    return Scaffold(
      appBar: DefaultAppbar(title: "Team $teamname Competitions"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: competitionService.when(
          data: (comps) {
            if (comps.isEmpty) {
              return const Center(child: Text("No competitions added yet."));
            }
            return ListView.builder(
              itemCount: comps.length,
              itemBuilder: (context, index) {
                final comp = comps[index];
                return _buildCompetitionCard(context, comp);
              },
            );
          },
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateCompetitionScreen(teamId: team_id.toString())))
              .then((_) {
            ref.invalidate(teamListProvider); // Refresh the list after adding a player
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCompetitionCard(BuildContext context, dynamic comp) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompetitionScreen(comp_id: comp.id, team_id: team_id),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.inactiveGray, width: 1.5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            comp.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "Created At: ${comp.createdAt}\nCompetition Type: ${comp.competition_type}",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  void ReplaceValues(String name, String desc) {
    teamname = name;
    teamdesc = desc;
  }
}
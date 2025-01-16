import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/providers/match_provider.dart';
import 'package:football_coach_app/providers/player_in_match_provider.dart';
import 'package:football_coach_app/screens/add_players_to_match.dart';
import 'package:football_coach_app/screens/grade_screen.dart';
import 'package:football_coach_app/screens/player_profile_screen.dart';

import 'login_screen.dart';

String match_title = "";
bool? match_finished = false;
DateTime createdAt = DateTime(0000);


class MatchScreen extends ConsumerWidget{
  const MatchScreen({super.key, required this.match_id, required this.team_id});

  final int? team_id;
  final int? match_id;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log(match_id.toString());
    log(team_id.toString());

    var getMatch = ref.watch(getMatchByIdProvider(match_id!));
    var getMatchStarters = ref.watch(getAllStartingPlayersInMatchProvider(match_id!));
    var getMatchSubs = ref.watch(getAllSubPlayersInMatchProvider(match_id!));

    getMatch.when(data: (match)  => ReplaceValues(match.title, match.match_date, match.finsihed), error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()));
    
    return Scaffold(
      appBar: AppBar(
        title: Text(match_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                // Log out from Firebase
                await FirebaseAuth.instance.signOut();
                // After sign-out, navigate to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error logging out: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints constraints){
        return Column(
        children: [
          Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight / 2.5,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(border: Border.all(color: CupertinoColors.inactiveGray), borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(children: [
              getMatchStarters.when(data: (starters){
                if(starters.isEmpty){
                  return const Text("No starters, add starters to begin");
                }
                return Expanded(child: ListView.builder(itemCount: starters.length,
                    itemBuilder: (context, index){
                      final starter = starters[index];
                      return Container(child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => PlayerProfileScreen(player_id: starter.id)));
                        },
                      title: Text("${starter.first_name} ${starter.last_name}", style: TextStyle(fontSize: 15),),
                      subtitle: Text("${starter.position} ${starter.competition_type} ${starter.country}", style: const TextStyle(fontSize: 13),),
                      ));
                    })
                );
              }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()))
            ],),
          ),
          const SizedBox(height: 10,),
          Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight / 2.5,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(border: Border.all(color: CupertinoColors.inactiveGray), borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(children: [
              getMatchSubs.when(data: (starters){
                if(starters.isEmpty){
                  return const Text("No subs, add starters to begin");
                }
                return Expanded(child: ListView.builder(itemCount: starters.length,
                    itemBuilder: (context, index){
                      final starter = starters[index];
                      return Container(child: ListTile(
                        title: Text("${starter.first_name} ${starter.last_name}", style: TextStyle(fontSize: 15),),
                        subtitle: Text("${starter.position} ${starter.competition_type} ${starter.country}", style: const TextStyle(fontSize: 13),),
                      ));
                    })
                );
              }, error: (error, stackTrace) => Center(child: Text('Error: $error')), loading: () => const Center(child: CircularProgressIndicator()))
            ],),
          ),
          const SizedBox(height: 10,),
          Container(
            height: constraints.maxHeight / 6.5,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(border: Border.all(color: CupertinoColors.inactiveGray), borderRadius: BorderRadius.all(Radius.circular(30))),
            child: match_finished == false ? Column(
              children: [
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => AddPlayersToMatch(match_id: match_id, team_id: team_id,)));
                }, child: Container(width: constraints.maxWidth * 0.95,height: constraints.maxHeight / 6.5 / 2.5, decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.all(Radius.circular(45))), child: Container(alignment: Alignment.center, child: Text("ADD PLAYERS"),),),),
                SizedBox(height: 10,),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => GradeScreen(match_id: match_id)));
                }, child: Container(width: constraints.maxWidth * 0.95,height: constraints.maxHeight / 6.5 / 2.5, decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(45))), child: Container(alignment: Alignment.center, child: Text("END MATCH"),),),),
              ],
            ): Container(height: constraints.maxHeight / 6.5,),
          )
        ],
        );
    },
    )
    );
  }

}

void ReplaceValues(String title, DateTime date, bool fin) {
  match_title = title;
  createdAt = date;
  match_finished = fin;

}
import 'dart:developer';

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:datepicker_dropdown/order_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_coach_app/enums/ECompetition_type.dart';
import 'package:football_coach_app/enums/EPositions.dart';
import 'package:football_coach_app/models/player_model.dart';
import 'package:football_coach_app/providers/player_provider.dart';
import 'package:football_coach_app/providers/team_provider.dart';
import 'package:football_coach_app/screens/register_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:football_coach_app/enums/EGender.dart';
import 'package:football_coach_app/enums/ECountries.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

var gender_values = Gender.values.map((e) => e.name).toList();
var country_values = Countries.values.map((e) => e.name).toList();
var competition_type_values = Competition_type.values.map((e) => e.name).toList();
var position_values = Position.values.map((e) => e.name).toList();

String initGenderValue = gender_values.first;
String initCountryValue = country_values.first;
String initCompetitionValue = competition_type_values.first;
String initPositionValue = position_values.first;

int _selectedDay = 0;
int _selectedMonth = 0;
int _selectedYear = 0;

class AddPlayerToTeamScreen extends ConsumerWidget{
  AddPlayerToTeamScreen({super.key, required this.team_id});

  final int? team_id;


  final TextEditingController _first_name = TextEditingController();
  final TextEditingController _last_name = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref){
    
    return Scaffold(
      appBar: AppBar(title: Text("Add player to team"),),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _first_name,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _last_name,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              const Row(spacing: 30, children: [
                GenderDropDownButton(),
                CountryDropDownButton(),
                CompetitionTypeDropDownButton()
              ]),
              BirthDatePicker(),
              SizedBox(height: 10),
              Container(alignment: Alignment.centerLeft,child: Text("Position", style: TextStyle(fontSize: 20),),),
              PositionDropDownButton(),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () async {
                try{
                  DateTime birthday = DateTime(_selectedYear, _selectedMonth, _selectedDay);
                  
                  var player = Player(team_id: team_id!, createdAt: DateTime.now(), first_name: _first_name.text, last_name: _last_name.text, gender: initGenderValue, competition_type: initCompetitionValue, birthdate: birthday, country: initCountryValue, position: initPositionValue, secondary_position: null);
                  
                  await ref.read(addPlayerToTeamProvider(player).future);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Player Created Successfully!')),
                  );

                  Navigator.of(context).pop();
                }catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),);
                }
              }, child: const Text("Add Player"))
            ]
        ),
      ),
    );
  }
}

class GenderDropDownButton extends StatefulWidget {
  const GenderDropDownButton({super.key});

  @override
  State<GenderDropDownButton> createState() => _GenderDropDownButtonState();
}

class _GenderDropDownButtonState extends State<GenderDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: initGenderValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          initGenderValue = value!;
        });
      },
      items: gender_values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CountryDropDownButton extends StatefulWidget {
  const CountryDropDownButton({super.key});

  @override
  State<CountryDropDownButton> createState() => _CountryDropDownButton();
}

class _CountryDropDownButton extends State<CountryDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: initCountryValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          initCountryValue = value!;
        });
      },
      items: country_values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CompetitionTypeDropDownButton extends StatefulWidget {
  const CompetitionTypeDropDownButton({super.key});


  @override
  State<CompetitionTypeDropDownButton> createState() => _CompetitionTypeDropDownButton();
}

class _CompetitionTypeDropDownButton extends State<CompetitionTypeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: initCompetitionValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          initCompetitionValue = value!;
        });
      },
      items: competition_type_values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class PositionDropDownButton extends StatefulWidget {
  const PositionDropDownButton({super.key});


  @override
  State<PositionDropDownButton> createState() => _PositionDropDownButton();
}

class _PositionDropDownButton extends State<PositionDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: initPositionValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_downward),
      elevation: 12,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          initPositionValue = value!;
        });
      },
      items: position_values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
class BirthDatePicker extends StatefulWidget {
  const BirthDatePicker({super.key});


  @override
  State<BirthDatePicker> createState() => _BirthDatePicker();
}
class _BirthDatePicker extends State<BirthDatePicker> {
  @override
  Widget build(BuildContext context) {
    return DropdownDatePicker(dateformatorder: OrderFormat.DMY,
      onChangedDay: (value){
      setState(() {
        _selectedDay = int.parse(value!);
      });
      },
      onChangedMonth: (value){
        setState(() {
          _selectedMonth = int.parse(value!);
        });
      },
      onChangedYear: (value){
        setState(() {
          _selectedYear = int.parse(value!);
        });
      },
    );
  }
}






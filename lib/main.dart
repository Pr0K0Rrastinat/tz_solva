import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz_solva/screens/settings_screen.dart';
import 'game_bloc.dart';
import 'game_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
      child: MaterialApp(
        home: SettingsScreen(),
      ),
    );
  }
}

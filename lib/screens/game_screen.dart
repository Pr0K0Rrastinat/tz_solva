import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../game_bloc.dart';
import '../game_event.dart';
import '../game_state.dart';
import 'result_screen.dart';

class GameScreen extends StatelessWidget {
  final TextEditingController _guessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Фоновый цвет экрана
      appBar: AppBar(
        title: Text('Guess the Number'),
        backgroundColor: Colors.orange,
      ),
      body: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {
          if (state is GameWon || state is GameLost) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ResultScreen(state)),
            );
          }
        },
        builder: (context, state) {
          if (state is GameInProgress) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${state.remainingAttempts}', // Отображаем оставшиеся попытки крупным текстом
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 48, // Крупный размер шрифта
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Attempts remaining',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 32),
                  TextField(
                    controller: _guessController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your guess',
                      labelStyle: TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.orange),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      int guess = int.parse(_guessController.text);
                      BlocProvider.of<GameBloc>(context).add(MakeGuess(guess));
                      _guessController.clear();
                    },
                    child: Text('Submit Guess', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Text(
              'Preparing game...',
              style: TextStyle(color: Colors.orange),
            ),
          );
        },
      ),
    );
  }
}

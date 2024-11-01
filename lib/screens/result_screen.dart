import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../game_bloc.dart';
import '../game_event.dart';
import '../game_state.dart';

class ResultScreen extends StatelessWidget {
  final GameState gameResult;

  ResultScreen(this.gameResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Фон экрана
      appBar: AppBar(
        title: Text(gameResult is GameWon ? 'You Won!' : 'Game Over'),
        backgroundColor: Colors.orange, // Цвет заголовка
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              gameResult is GameWon
                  ? 'Congratulations! You guessed it!'
                  : 'Better luck next time! The number was ${(gameResult as GameLost).targetNumber}',
              style: TextStyle(
                fontSize: 24,
                color: gameResult is GameWon ? Colors.green : Colors.red, // Зеленый для победы, красный для поражения
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Цвет кнопки
              ),
              onPressed: () {
                BlocProvider.of<GameBloc>(context).add(RestartGame());
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(
                'Play Again',
                style: TextStyle(color: Colors.black), // Цвет текста кнопки
              ),
            ),
          ],
        ),
      ),
    );
  }
}

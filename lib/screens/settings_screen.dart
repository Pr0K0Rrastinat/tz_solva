import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../game_bloc.dart';
import '../game_event.dart';
import 'game_screen.dart';

class SettingsScreen extends StatelessWidget {
  final TextEditingController _rangeController = TextEditingController();
  final TextEditingController _attemptsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Устанавливаем фоновый цвет на черный
      appBar: AppBar(
        title: Text('Game Settings'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _rangeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter range (n)',
                labelStyle: TextStyle(color: Colors.orange), // Оранжевый цвет текста
                filled: true,
                fillColor: Colors.grey[800], // Серый фон TextField
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),  
              style: TextStyle(color: Colors.orange), // Цвет вводимого текста
            ),
            SizedBox(height: 16),
            TextField(
              controller: _attemptsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter attempts (m)',
                labelStyle: TextStyle(color: Colors.orange),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              style: TextStyle(color: Colors.orange),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Цвет кнопки
              ),
              onPressed: () {
                int? range = int.tryParse(_rangeController.text);
                int? attempts = int.tryParse(_attemptsController.text);

                if (range != null && range > 0 && attempts != null && attempts > 0) {
                  BlocProvider.of<GameBloc>(context).add(StartGame(range, attempts));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Invalid Input', style: TextStyle(color: Colors.orange)),
                      content: Text(
                        'Please enter positive numbers for both range and attempts.',
                        style: TextStyle(color: Colors.orange),
                      ),
                      backgroundColor: Colors.grey[800], // Серый фон диалога
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK', style: TextStyle(color: Colors.orange)),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Start Game', style: TextStyle(color: Colors.black)), // Текст кнопки черного цвета
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  late int _targetNumber;
  late int _remainingAttempts;
  late int _maxRange;

  GameBloc() : super(GameInitial()) {
    on<StartGame>((event, emit) {
      _maxRange = event.range;
      _remainingAttempts = event.attempts;
      _targetNumber = Random().nextInt(_maxRange) + 1;
      emit(GameInProgress(_remainingAttempts, totalAttempts: event.attempts));
    });

    on<MakeGuess>((event, emit) {
      if (event.guess == _targetNumber) {
        emit(GameWon());
      } else {
        _remainingAttempts--;
        if (_remainingAttempts == 0) {
          emit(GameLost(_targetNumber));
        } else {
          emit(GameInProgress(_remainingAttempts, totalAttempts: _maxRange));
        }
      }
    });

    on<RestartGame>((event, emit) {
      emit(GameInitial());
    });
  }
}

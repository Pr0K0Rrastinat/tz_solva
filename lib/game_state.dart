abstract class GameState {}

class GameInitial extends GameState {}

class GameInProgress extends GameState {
  final int remainingAttempts;
  final int totalAttempts;

  GameInProgress(this.remainingAttempts, {required this.totalAttempts});
} 



class GameWon extends GameState {}

class GameLost extends GameState {
  final int targetNumber;

  GameLost(this.targetNumber);
}

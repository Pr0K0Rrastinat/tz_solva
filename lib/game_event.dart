abstract class GameEvent {}

class StartGame extends GameEvent {
  final int range;
  final int attempts;

  StartGame(this.range, this.attempts);
}

class MakeGuess extends GameEvent {
  final int guess;

  MakeGuess(this.guess);
}

class RestartGame extends GameEvent {}

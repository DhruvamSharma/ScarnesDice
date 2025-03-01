part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {}

final class Roll extends GameEvent {
  Roll();
  @override
  List<Object> get props => [];
}

final class Hold extends GameEvent {
  Hold();
  @override
  List<Object> get props => [];
}

final class Reset extends GameEvent {

  Reset();

  @override
  List<Object> get props => [];
}

final class ComputerTurn extends GameEvent {
  ComputerTurn();

  @override
  List<Object> get props => [];
}

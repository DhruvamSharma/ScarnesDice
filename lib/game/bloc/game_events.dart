part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {}

final class Roll extends GameEvent {
  Roll(): isPlayerRoll = true;
  Roll.computer(): isPlayerRoll = false;

  final bool isPlayerRoll;

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

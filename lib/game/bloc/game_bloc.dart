import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_state.dart';
part 'game_events.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState.initial()) {
    on<Roll>(_onRollDice);
    on<Hold>(_onHold);
    on<Reset>(_onReset);
  }

  void _onRollDice(Roll event, Emitter<GameState> emit) {
    final diceValue = 1 + Random().nextInt(6);
    emit(
      state.copyWith(
        currentDiceValue: diceValue,
      ),
    );
  }

  void _onHold(Hold event, Emitter<GameState> emit) {}

  void _onReset(Reset event, Emitter<GameState> emit) {}
}

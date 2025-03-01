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
    // select a random number between 1 and 6
    final diceValue = 1 + Random().nextInt(6);
    // if the dice value is 1, reset the turn score
    // otherwise, add the dice value to turn score
    emit(
        state.copyWith(
          currentDiceValue: diceValue,
          playerTurnScore: diceValue == 1 ? 0 : state.playerTurnScore + diceValue,
        ),
    );
  }

  void _onHold(Hold event, Emitter<GameState> emit) {
    emit(
      state.copyWith(
        playerTotalScore: state.playerTotalScore + state.playerTurnScore,
        playerTurnScore: 0,
      ),
    );
  }

  void _onReset(Reset event, Emitter<GameState> emit) {
    // reset the player's total score and turn score
    // reset the computer's total score and turn score
    // emit the new state
    emit(const GameState.initial());
  }
}

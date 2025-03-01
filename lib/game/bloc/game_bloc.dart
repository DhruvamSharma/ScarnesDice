import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_events.dart';

part 'game_state.dart';

const _computerHoldThreshold = 20;

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState.initial()) {
    on<Roll>(_onRollDice);
    on<Hold>(_onHold);
    on<Reset>(_onReset);
    on<ComputerTurn>(_onComputerTurn);
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

    // if the dice value is 1, end the player's turn
    if (diceValue == 1) {
      add(Hold());
    }
  }

  FutureOr<void> _onHold(Hold event, Emitter<GameState> emit) {
    // add the player's turn score to the player's total score
    // reset the player's turn score
    // emit the new state
    if (state.isPlayerTurn) {
      emit(
        state.copyWith(
          playerTotalScore: state.playerTotalScore + state.playerTurnScore,
          playerTurnScore: 0,
        ),
      );
      add(ComputerTurn());
    } else {
      emit(
        state.copyWith(
          computerTotalScore:
          state.computerTotalScore + state.computerTurnScore,
          computerTurnScore: 0,
          isPlayerTurn: true,
        ),
      );
    }
  }

  FutureOr<void> _onReset(Reset event, Emitter<GameState> emit) {
    // reset the player's total score and turn score
    // reset the computer's total score and turn score
    // emit the new state
    emit(const GameState.initial());
  }

  Future<void> _onComputerTurn(
      ComputerTurn event, Emitter<GameState> emit) async {
    // disable the player's turn
    emit(
      state.copyWith(
        isPlayerTurn: false,
      ),
    );

    // computer will keep rolling until it reaches the hold threshold
    // or rolls a 1
    final diceValue = 1 + Random().nextInt(6);
    emit(
      state.copyWith(
        currentDiceValue: diceValue,
        computerTurnScore:
        diceValue == 1 ? 0 : state.computerTurnScore + diceValue,
      ),
    );

    if (diceValue == 1 || state.computerTurnScore >= _computerHoldThreshold) {
      add(Hold());
    } else {
      _delayedCall(() {
        add(ComputerTurn());
      });
    }
  }

  void _delayedCall(Function action) {
    Future<dynamic>.delayed(const Duration(seconds: 1))
        .whenComplete(() => action.call());
  }
}

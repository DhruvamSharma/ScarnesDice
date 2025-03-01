part of 'game_bloc.dart';

final class GameState extends Equatable {
  const GameState({
    required this.playerTurnScore,
    required this.playerTotalScore,
    required this.computerTurnScore,
    required this.computerTotalScore,
    required this.currentDiceValue,
    required this.isPlayerTurn,
  });

  const GameState.initial() : this(
    playerTurnScore: 0,
    playerTotalScore: 0,
    computerTurnScore: 0,
    computerTotalScore: 0,
    currentDiceValue: 1,
    isPlayerTurn: true,
  );

  final int playerTurnScore;
  final int playerTotalScore;
  final int computerTurnScore;
  final int computerTotalScore;
  final int currentDiceValue;
  final bool isPlayerTurn;

  @override
  List<Object> get props => [
    playerTurnScore,
    playerTotalScore,
    computerTurnScore,
    computerTotalScore,
    currentDiceValue,
    isPlayerTurn,
  ];

  GameState copyWith({
    int? playerTurnScore,
    int? playerTotalScore,
    int? computerTurnScore,
    int? computerTotalScore,
    int? currentDiceValue,
    bool? isPlayerTurn,
  }) {
    return GameState(
      playerTurnScore: playerTurnScore ?? this.playerTurnScore,
      playerTotalScore: playerTotalScore ?? this.playerTotalScore,
      computerTurnScore: computerTurnScore ?? this.computerTurnScore,
      computerTotalScore: computerTotalScore ?? this.computerTotalScore,
      currentDiceValue: currentDiceValue ?? this.currentDiceValue,
      isPlayerTurn: isPlayerTurn ?? this.isPlayerTurn,
    );
  }
}

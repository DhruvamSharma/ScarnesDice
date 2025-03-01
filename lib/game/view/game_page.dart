import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scarnes_dice_starter/game/bloc/game_bloc.dart';
import 'package:scarnes_dice_starter/l10n/l10n.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider<GameBloc>(
      create: (_) => GameBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.gameAppBarTitle),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _Score(),
              SizedBox(height: 20),
              _DiceRoll(),
              SizedBox(height: 20),
              _ActionButtonRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Score extends StatelessWidget {
  const _Score({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: 'Player: ${state.playerTotalScore}'),
              const TextSpan(text: ' | '),
              TextSpan(text: 'Computer: ${state.computerTotalScore}'),
            ],
          ),
        );
      },
    );
  }
}

class _DiceRoll extends StatelessWidget {
  const _DiceRoll();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (previous, current) =>
          previous.currentDiceValue != current.currentDiceValue,
      builder: (context, state) {
        final diceAssetLocation = switch (state.currentDiceValue) {
          1 => 'assets/dice1.png',
          2 => 'assets/dice2.png',
          3 => 'assets/dice3.png',
          4 => 'assets/dice4.png',
          5 => 'assets/dice5.png',
          _ => 'assets/dice6.png',
        };
        return SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(diceAssetLocation),
        );
      },
    );
  }
}

class _ActionButtonRow extends StatelessWidget {
  const _ActionButtonRow();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<GameBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {
            bloc.add(Roll());
          },
          child: Text(l10n.rollButton),
        ),
        OutlinedButton(
          onPressed: () {
            bloc.add(Hold());
          },
          child: Text(l10n.holdButton),
        ),
        OutlinedButton(
          onPressed: () {
            bloc.add(Reset());
          },
          child: Text(l10n.resetButton),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scarnes_dice_starter/l10n/l10n.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.gameAppBarTitle),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Hello, Scarne's Dice!"),
            SizedBox(height: 20),
            _DiceRoll(),
            SizedBox(height: 20),
            _ActionButtonRow(),
          ],
        ),
      ),
    );
  }
}

class _DiceRoll extends StatelessWidget {
  const _DiceRoll();

  @override
  Widget build(BuildContext context) {
    const diceAssetLocation = 'assets/dice1.png';
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.asset(diceAssetLocation),
    );
  }
}

class _ActionButtonRow extends StatelessWidget {
  const _ActionButtonRow();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text(l10n.rollButton),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(l10n.holdButton),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(l10n.resetButton),
        ),
      ],
    );
  }
}

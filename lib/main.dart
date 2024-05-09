import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/views/playing_view/game.dart';

void main() {
  runApp(
      const MaterialApp(
            title: "Tic-Tac-Toe",
            debugShowCheckedModeBanner: false,
            home: Game()
          )
      );
}


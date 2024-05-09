import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/views/game.dart';

class Animations extends CustomPainter {

    VictoryPositionEnum victoryPosition;
    
    Animations({required this.victoryPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;

    if(victoryPosition == VictoryPositionEnum.diagonal1){
        Offset start = const Offset(0, 0);
        Offset end = Offset(size.width, size.height);
        canvas.drawLine(start, end, paint);
        return;
    }

    if(victoryPosition == VictoryPositionEnum.diagonal2){
        Offset start = Offset(size.width, 0);
        Offset end = Offset(0, size.height);
        canvas.drawLine(start, end, paint);
        return;
    }

    if(victoryPosition == VictoryPositionEnum.column1){
        Offset start = Offset((size.width/6), 0);
        Offset end = Offset((size.width/6), size.height);
        canvas.drawLine(start, end, paint);
        return;
    }

    if(victoryPosition == VictoryPositionEnum.column2){
        Offset start = Offset((size.width/6) * 3, 0);
        Offset end = Offset((size.width/6) * 3, size.height);
        canvas.drawLine(start, end, paint);
        return;
    }
    
    if(victoryPosition == VictoryPositionEnum.column3){
        Offset start = Offset((size.width/6) * 5, 0);
        Offset end = Offset((size.width/6) * 5, size.height);
        canvas.drawLine(start, end, paint);
        return;
    }
    if(victoryPosition == VictoryPositionEnum.row1){
        Offset start = Offset(0, (size.height/6));
        Offset end = Offset(size.width, (size.height/6));
        canvas.drawLine(start, end, paint);
        return;
    }
  
    if(victoryPosition == VictoryPositionEnum.row2){
        Offset start = Offset(0, (size.height/6) * 3);
        Offset end = Offset(size.width, (size.height/6) * 3);
        canvas.drawLine(start, end, paint);
        return;
    }

    if(victoryPosition == VictoryPositionEnum.row3){
        Offset start = Offset(0, (size.height/6) * 5);
        Offset end = Offset(size.width, (size.height/6) * 5);
        canvas.drawLine(start, end, paint);
        return;
    }
  }

  @override
  bool shouldRepaint(covariant Animations oldDelegate) => false;
}

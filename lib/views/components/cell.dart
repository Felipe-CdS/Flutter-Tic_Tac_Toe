import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/views/game.dart';

class Cell extends StatefulWidget {
    final int position;
    final MatrixEnum occupied;
    final GameLoopState gameLoopState;
    final Function setOccupiedFunction;
            
    const Cell({
        super.key, 
        required this.position, 
        required this.occupied,
        required this.gameLoopState,
        required this.setOccupiedFunction
    });

    @override
    State<Cell> createState() => _CellState();
}
class _CellState extends State<Cell>{

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: (){
                if(widget.occupied == MatrixEnum.free){
                    widget.setOccupiedFunction(widget.position);
                }
            },
            child: Container(
                height: 128,
                width: 128,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                ),
                child: widget.occupied == MatrixEnum.playerX ? 
                    const Icon(Icons.close, size: 50) : 
                    widget.occupied == MatrixEnum.playerO ? 
                        const Icon(Icons.radio_button_unchecked, size: 50) : const SizedBox.shrink()
                 )
        );
    }
}

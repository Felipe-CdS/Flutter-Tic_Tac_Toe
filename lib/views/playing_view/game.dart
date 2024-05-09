import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/views/playing_view/components/cell.dart';
import 'package:tic_tac_toe_app/views/result_screen/result_screen.dart';

enum GameLoopState { turnPlayerX, turnPlayerO }
enum MatrixEnum { playerX, playerO, free }

class Game extends StatefulWidget {
    const Game({super.key});

    @override
    State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
    
    GameLoopState gameLoopState = GameLoopState.turnPlayerX;
    final List<bool> _selectedPlay = <bool>[true, false];

    List<List<MatrixEnum>> gameMatrix = [
        [MatrixEnum.free, MatrixEnum.free, MatrixEnum.free],
        [MatrixEnum.free, MatrixEnum.free, MatrixEnum.free],
        [MatrixEnum.free, MatrixEnum.free, MatrixEnum.free],
    ];

    setOccupiedCell(int position){
        setState(() {
            int xCoord = position % 3, yCoord = (position / 3).truncate();

            for(int i = 0; i < gameMatrix.length; i++){
                for(int j = 0; j < gameMatrix[0].length; j++){
                    if(i == yCoord && j == xCoord){
                        if(gameLoopState == GameLoopState.turnPlayerX){
                            gameMatrix[i][j] = MatrixEnum.playerX;
                            gameLoopState = GameLoopState.turnPlayerO;
                            _selectedPlay[0] = false;
                            _selectedPlay[1] = true;
                            return;
                        }
                        if(gameLoopState == GameLoopState.turnPlayerO){
                            gameMatrix[i][j] = MatrixEnum.playerO;
                            gameLoopState = GameLoopState.turnPlayerX;
                            _selectedPlay[0] = true;
                            _selectedPlay[1] = false;
                            return;
                        }
                    }
                }
            }
        });
        if(checkWinner()){
            Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ResultScreen()),
                );

        }
    }

    bool checkWinner(){
        for(int j = 0; j < gameMatrix[0].length; j++){
            if(gameMatrix[0][j] != MatrixEnum.free && 
                gameMatrix[0][j] == gameMatrix[1][j] && 
                gameMatrix[0][j] == gameMatrix[2][j]){
                return true;
            }

            if(gameMatrix[j][0] != MatrixEnum.free && 
                gameMatrix[j][0] == gameMatrix[j][1] && 
                gameMatrix[j][0] == gameMatrix[j][2]){
                return true;
            }

        }

        if(gameMatrix[0][0] != MatrixEnum.free && 
            gameMatrix[0][0] == gameMatrix[1][1] && 
            gameMatrix[0][0] == gameMatrix[2][2]){
            return true;
        }
        if(gameMatrix[0][2] != MatrixEnum.free && 
            gameMatrix[0][2] == gameMatrix[1][1] && 
            gameMatrix[0][2] == gameMatrix[2][0]){
            return true;
        }
        return false;
    }
    
            
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text("Playing...")),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Table(
                            defaultColumnWidth: const FixedColumnWidth(128),
                            children: <TableRow>[
                                TableRow(
                                    children: [
                                        TableCell(child: 
                                            Cell(
                                                position: 0, 
                                                occupied: gameMatrix[0][0],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 1, 
                                                occupied: gameMatrix[0][1],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 2, 
                                                occupied: gameMatrix[0][2],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                    ],
                                ),
                                TableRow(
                                    children: [
                                        TableCell(child: 
                                            Cell(
                                                position: 3, 
                                                occupied: gameMatrix[1][0],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 4, 
                                                occupied: gameMatrix[1][1],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 5, 
                                                occupied: gameMatrix[1][2],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                    ],
                                ),
                                TableRow(
                                    children: [
                                        TableCell(child: 
                                            Cell(
                                                position: 6, 
                                                occupied: gameMatrix[2][0],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 7, 
                                                occupied: gameMatrix[2][1],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 8, 
                                                occupied: gameMatrix[2][2],
                                                setOccupiedFunction: setOccupiedCell,
                                                gameLoopState: gameLoopState
                                            )
                                        ),
                                    ],
                                ),
                                ],
                                ),
                                const Padding(padding: EdgeInsets.only(top: 30)),
                                const Text("Proximo Turno:"),
                                ToggleButtons(
                                    direction: Axis.horizontal,
                                    isSelected: _selectedPlay, 
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                    selectedBorderColor: Colors.black,
                                    selectedColor: Colors.white,
                                    fillColor: Colors.grey[700],
                                    color: Colors.grey[700],
                                    children: const <Widget>[
                                        Icon(Icons.close),
                                        Icon(Icons.radio_button_unchecked),
                                    ],
                                    onPressed: (int idx) {},
                                )
                                        ],
                        ),
                )
        );
    }
}

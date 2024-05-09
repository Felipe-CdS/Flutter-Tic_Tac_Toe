import 'package:flutter/material.dart';

class Home extends StatefulWidget {
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    final List<bool> _selectedPlay = <bool>[true, false];

    List<List<bool>> occupiedMatrix = [
        [false, false, false],
        [false, false, false],
        [false, false, false],
    ];

    setOccupiedCell(int position){
        setState(() {
            int xCoord = position % 3, yCoord = (position / 3).truncate();

            for(int i = 0; i < occupiedMatrix.length; i++){
                for(int j = 0; j < occupiedMatrix[0].length; j++){
                    if(i == yCoord && j == xCoord){
                        occupiedMatrix[i][j] = !occupiedMatrix[i][j];
                    }
                }
            }
        });
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
                                                occupied: occupiedMatrix[0][0],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 1, 
                                                occupied: occupiedMatrix[0][1],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 2, 
                                                occupied: occupiedMatrix[0][2],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                    ],
                                ),
                                TableRow(
                                    children: [
                                        TableCell(child: 
                                            Cell(
                                                position: 3, 
                                                occupied: occupiedMatrix[1][0],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 4, 
                                                occupied: occupiedMatrix[1][1],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 5, 
                                                occupied: occupiedMatrix[1][2],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                    ],
                                ),
                                TableRow(
                                    children: [
                                        TableCell(child: 
                                            Cell(
                                                position: 6, 
                                                occupied: occupiedMatrix[2][0],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 7, 
                                                occupied: occupiedMatrix[2][1],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                        TableCell(child: 
                                            Cell(
                                                position: 8, 
                                                occupied: occupiedMatrix[2][2],
                                                setOccupiedFunction: setOccupiedCell
                                            )
                                        ),
                                    ],
                                ),
                                ],
                                ),
                                const Padding(padding: EdgeInsets.only(top: 30)),
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
                                    onPressed: (int idx) {
                                        setState(() {
                                            for(int i = 0; i < _selectedPlay.length; i++){
                                                _selectedPlay[i] = false;                                           
                                            }
                                            _selectedPlay[idx] = true;                                           
                                        });
                                    },
                                )
                                        ],
                        ),
                )
        );
    }
}


class Cell extends StatefulWidget {
    final int position;
    final bool occupied;
    final Function setOccupiedFunction;
            
    const Cell({
        super.key, 
        required this.position, 
        required this.occupied,
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
                if(!widget.occupied){
                    widget.setOccupiedFunction(widget.position);
                }
            },
            child: Container(
                height: 128,
                width: 128,
                decoration: BoxDecoration(
                    color: widget.occupied ? Colors.grey[600] : Colors.white,
                    border: Border.all(
                        width: 1
                    ),
                ),
                child: Text(widget.occupied.toString()),
            )
        );
    }
}

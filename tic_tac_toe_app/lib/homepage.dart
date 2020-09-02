import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Extension of the HomePage Builder
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Extension of the HomePage State
class _HomePageState extends State<HomePage> {
  List<List<String>> myBoard = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  /*List<List<List<int>>> boardCoord = [
    [[0,0], [0,1], [0,2]],
    [[1,0], [1,1], [1,2]],
    [[2,0], [2,1], [2,2]]
  ];*/

  List<List<int>> boardCoord = [
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 0],
    [1, 1],
    [1, 2],
    [2, 0],
    [2, 1],
    [2, 2]
  ];

  bool oTurn = false;
  int rowBoard = -1;
  int colBoard = -1;
  List<String> displayBoxContext = ['', '', '', '', '', '', '', '', ''];

  int oScore = 0;
  int xScore = 0;
  int tileLeft = 9;

  //TextStyle Objects
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 10);

  //static var myNewFont = GoogleFonts.pressStart2P(
  //    textStyle: TextStyle(color: Colors.black, letterSpacing: 2));
  static var myNewFontWhite = GoogleFonts.pressStart2P(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 14));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          //Adding an expaned widget
          Expanded(
            child: Container(
                //color: Colors.red,
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text('Player X', style: myNewFontWhite),
                      SizedBox(
                        height: 20,
                      ),
                      Text(xScore.toString(), style: myNewFontWhite),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text('Player O', style: myNewFontWhite),
                      SizedBox(
                        height: 20,
                      ),
                      Text(oScore.toString(), style: myNewFontWhite),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                //Creating a grid with 9 containers
                itemCount: 9,
                //CrossAxis == number of objects per axis. Here we want 3x3 so 3 items each axis
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                //The actual Container object each
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0 || index == 1 || index == 2) {
                        rowBoard = 0;
                      } else if (index == 3 || index == 4 || index == 5) {
                        rowBoard = 1;
                      } else if (index == 6 || index == 7 || index == 8) {
                        rowBoard = 2;
                      }

                      _tapped(index);
                      //_tapped(index, Coord[row][index][0], Coord[row][index][1]);
                    },
                    child: Container(
                      //Adding the line between each container box
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[700])),
                      //The box contents is displayed by the displayBoxContent returned Object
                      child: Center(
                          child: Text(
                              myBoard[boardCoord[index][0]]
                                  [boardCoord[index][1]],
                              //displayBoxContext[index],
                              //index.toString(),
                              style: myNewFontWhite)),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Center(
                  child: Column(children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'TIC TAC TOE',
                  style: myNewFontWhite,
                ),
                SizedBox(height: 30),
                Text('@RAPITYYY', style: myNewFontWhite),
              ])),
              //color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    //SetState in flutter: whenever setState() is called, it will re run the HomePageState. (To display/update the current state)
    setState(() {
      int x = boardCoord[index][0];
      int y = boardCoord[index][1];
      if (oTurn && myBoard[x][y] == '') {
        myBoard[x][y] = 'O';
        tileLeft -= 1;
        //displayBoxContext[index] = 'O';
      } else if (!oTurn && myBoard[x][y] == '') {
        myBoard[x][y] = 'X';
        tileLeft -= 1;
        //displayBoxContext[index] = 'X';
      }
      oTurn = !oTurn;
      _checkWin(index, x, y);
    });
  }

  void _checkWin(int index, int x, int y) {
    String winner = "";

    int xCol = 0, xRow = 0, xDiag = 0, xRdiag = 0;
    int yCol = 0, yRow = 0, yDiag = 0, yRdiag = 0;

    for (int i = 0; i < 3; i++) {
      if (myBoard[x][i] == 'X') {
        xCol += 1;
      } else if (myBoard[x][i] == 'O') {
        yCol += 1;
      }

      if (myBoard[i][y] == 'X') {
        xRow += 1;
      } else if (myBoard[i][y] == 'O') {
        yRow += 1;
      }

      if (myBoard[i][i] == 'X') {
        xDiag += 1;
      } else if (myBoard[i][i] == 'O') {
        yDiag += 1;
      }

      if (myBoard[i][2 - i] == 'X') {
        xRdiag += 1;
      } else if (myBoard[i][2 - i] == 'O') {
        yRdiag += 1;
      }
    }

    //X wins
    if (xRow == 3 || xCol == 3 || xDiag == 3 || xRdiag == 3) {
      winner = 'X';
      xScore += 1;
      _displayWinner(winner);
    }

    //Y wins
    if (yRow == 3 || yCol == 3 || yDiag == 3 || yRdiag == 3) {
      winner = 'O';
      oScore += 1;
      _displayWinner(winner);
    }

    //Draw
    else if (tileLeft == 0 && winner == '') {
      winner = 'D';
      _displayWinner(winner);
    }
  }

  void _displayWinner(String winner) {
    showDialog(
        barrierDismissible:
            false, //You can't click anywahere else to get rid of the alert. (Set as false)
        context: context,
        builder: (BuildContext context) {
          if (winner == 'D') {
            return AlertDialog(
              title: Text("It was a draw!!!"),
              actions: <Widget>[
                FlatButton(
                    child: Text("Play Again!"),
                    //onPressed: _clearBoard,
                    onPressed: () {
                      _clearBoard();
                      Navigator.of(context)
                          .pop(); //Pop/Get rid of the aleart box
                    })
              ],
            );
          } else {
            return AlertDialog(
              title: Text("'" + winner + "' player won the game!!!"),
              actions: <Widget>[
                FlatButton(
                    child: Text("Play Again!"),
                    //onPressed: _clearBoard,
                    onPressed: () {
                      _clearBoard();
                      Navigator.of(context)
                          .pop(); //Pop/Get rid of the aleart box
                    })
              ],
            );
          }
        });
  }

  void _clearBoard() {
    setState(() {
      int size = 3;
      for (int r = 0; r < size; r++) {
        for (int c = 0; c < size; c++) {
          myBoard[r][c] = '';
        }
      }
      oTurn = false;
      tileLeft = 9;
    });
  }
}

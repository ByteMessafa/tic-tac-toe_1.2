import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tic_tac_toe_v1_2/widgets/box.dart';
import 'package:tic_tac_toe_v1_2/widgets/spCase.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Color aqua = HexColor('#00FFFF');
  Color? blo = Colors.blueAccent[700];
  bool xTurn = true;
  int oWin = 0;
  int xWin = 0;
  int draw = 0;

  List<SpCase> hisoka = [
    defCase,
    defCase,
    defCase,
    defCase,
    defCase,
    defCase,
    defCase,
    defCase,
    defCase
  ];
  //the functions********************************
  reset() {
    for (int j = 0; j < 9; j++) {
      hisoka[j] = defCase;
    }
  }

  swap() {
    xTurn = !xTurn;
  }

  play(int i) {
    setState(() {
      if (hisoka[i].value == '') {
        hisoka[i] = xTurn ? xCase : oCase;
        swap();
      }
    });
  }

  xIsWin() {
    if ((hisoka[0].value == hisoka[1].value &&
            hisoka[0].value == hisoka[2].value &&
            hisoka[0].value == "X") ||
        (hisoka[3].value == hisoka[4].value &&
            hisoka[3].value == hisoka[5].value &&
            hisoka[3].value == "X") ||
        (hisoka[6].value == hisoka[7].value &&
            hisoka[6].value == hisoka[8].value &&
            hisoka[6].value == "X") ||
        (hisoka[0].value == hisoka[3].value &&
            hisoka[0].value == hisoka[6].value &&
            hisoka[0].value == "X") ||
        (hisoka[1].value == hisoka[4].value &&
            hisoka[1].value == hisoka[7].value &&
            hisoka[1].value == "X") ||
        (hisoka[2].value == hisoka[5].value &&
            hisoka[2].value == hisoka[8].value &&
            hisoka[2].value == "X") ||
        (hisoka[0].value == hisoka[4].value &&
            hisoka[0].value == hisoka[8].value &&
            hisoka[0].value == "X") ||
        (hisoka[2].value == hisoka[4].value &&
            hisoka[2].value == hisoka[6].value &&
            hisoka[2].value == "X")) {
      setState(() {
        _showAlertDialog(context, 'X');
        print("X is win");
        reset();
        xWin++;
        xTurn = true;
      });
    }
  }

  oIsWin() {
    if ((hisoka[0].value == hisoka[1].value &&
            hisoka[0].value == hisoka[2].value &&
            hisoka[0].value == "O") ||
        (hisoka[3].value == hisoka[4].value &&
            hisoka[3].value == hisoka[5].value &&
            hisoka[3].value == "O") ||
        (hisoka[6].value == hisoka[7].value &&
            hisoka[6].value == hisoka[8].value &&
            hisoka[6].value == "O") ||
        (hisoka[0].value == hisoka[3].value &&
            hisoka[0].value == hisoka[6].value &&
            hisoka[0].value == "O") ||
        (hisoka[1].value == hisoka[4].value &&
            hisoka[1].value == hisoka[7].value &&
            hisoka[1].value == "O") ||
        (hisoka[2].value == hisoka[5].value &&
            hisoka[2].value == hisoka[8].value &&
            hisoka[2].value == "O") ||
        (hisoka[0].value == hisoka[4].value &&
            hisoka[0].value == hisoka[8].value &&
            hisoka[0].value == "O") ||
        (hisoka[2].value == hisoka[4].value &&
            hisoka[2].value == hisoka[6].value &&
            hisoka[2].value == "O")) {
      setState(() {
        _showAlertDialog(context, 'O');
        reset();
        oWin++;
        xTurn = false;
      });
    }
  }

  DrawResult() {
    if (hisoka[0].value != '' &&
        hisoka[1].value != '' &&
        hisoka[2].value != '' &&
        hisoka[3].value != '' &&
        hisoka[4].value != '' &&
        hisoka[5].value != '' &&
        hisoka[6].value != '' &&
        hisoka[7].value != '' &&
        hisoka[8].value != '') {
      _showAlertDialogDraw(context);
      reset();
      draw++;
    }
  }

  void _showAlertDialog(BuildContext context, String a) {
    showDialog(
      barrierColor: const Color.fromARGB(177, 0, 0, 0),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: (a == 'X') ? blo : aqua,
          title: const Text(
            'We have a winner',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          content: Text('$a Win ....',
              style: const TextStyle(
                  fontSize: 22, decoration: TextDecoration.underline)),
          actions: <Widget>[
            TextButton(
              child: const Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialogDraw(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text('Draw'),
          ),
          content: Text('Great gime'),
          actions: <Widget>[
            TextButton(
              child: const Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//********************************************************* */
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: aqua,
                        size: 50,
                      ),
                      Text(
                        "${oWin} wins",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: aqua,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.balance_rounded,
                        color: Colors.black,
                        size: 50,
                      ),
                      Text(
                        "${draw} draws",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.close_rounded,
                        color: blo,
                        size: 50,
                      ),
                      Text(
                        "$xWin wins",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: blo),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //===========================================================
          //===========================================================
          const SizedBox(
            height: 30,
          ),
          //²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
          Container(
            width: 360,
            height: 360,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(0);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[0].value,
                        color: hisoka[0].color,
                        size: hisoka[0].size,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(1);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[1].value,
                        color: hisoka[1].color,
                        size: hisoka[1].size,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(2);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[2].value,
                        color: hisoka[2].color,
                        size: hisoka[2].size,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(3);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[3].value,
                        color: hisoka[3].color,
                        size: hisoka[3].size,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(4);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[4].value,
                        color: hisoka[4].color,
                        size: hisoka[4].size,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(5);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[5].value,
                        color: hisoka[5].color,
                        size: hisoka[5].size,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(6);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[6].value,
                        color: hisoka[6].color,
                        size: hisoka[6].size,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(7);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[7].value,
                        color: hisoka[7].color,
                        size: hisoka[7].size,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            play(8);
                            xIsWin();
                            oIsWin();
                            DrawResult();
                          },
                        );
                      },
                      child: Box(
                        value: hisoka[8].value,
                        color: hisoka[8].color,
                        size: hisoka[8].size,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //====================================================================
          //====================================================================
          const SizedBox(
            height: 8,
          ),
          //========================================================
          Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Center(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: !xTurn ? blo : aqua,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          xTurn ? Icons.close_rounded : Icons.circle_outlined,
                          size: 75,
                          color: xTurn ? blo : aqua,
                        ),
                      ),
                    )),
              )),
          const SizedBox(
            height: 8,
          ),
          //==============================================
          Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      reset();
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.refresh_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                      child: Text(
                    xTurn ? "X: PLAYER" : "O: PLAYER",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

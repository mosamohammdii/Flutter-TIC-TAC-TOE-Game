import 'package:flutter/material.dart';
import 'package:flutter_application/screens/constant/constant.dart';
import 'dart:math';

import 'package:flutter_application/screens/quiz_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List xorList = ["", "", "", "", "", "", "", "", "", ""];
  bool isPlay = true;
  int player1 = 0;
  int player2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            xorList = ["", "", "", "", "", "", "", "", "", ""];
          });
        },
      )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Player1"),
                    Container(height: 40, child: Image.asset("images/x.png"))
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 235, 234, 234),
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '${player1} - ${player2}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Column(
                  children: [
                    Text("palery2"),
                    Container(height: 40, child: Image.asset("images/o.png"))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 235, 234, 234),
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            _addXorList(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: index == 8 || index == 5 || index == 2
                                    ? BorderSide(color: Colors.white)
                                    : BorderSide(
                                        color: Colors.grey.shade300, width: 2),
                                top: index == 0 || index == 1 || index == 2
                                    ? BorderSide(color: Colors.white)
                                    : BorderSide(
                                        color: Colors.grey.shade300, width: 2),
                              ),
                            ),
                            child: xorList[index] == ""
                                ? Text("")
                                : Container(
                                    child: Image.asset(
                                      "images/${xorList[index].toString()}.png",
                                      scale: 0.5,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addXorList(int index) {
    setState(() {
      if (xorList[index] != "") {
        return;
      }
      isPlay ? xorList[index] = 'x' : xorList[index] = 'o';

      isPlay = !isPlay;

      if (checkWinner(xorList[index]) == "x") {
        setState(() {
          player1++;
        });
      } else if (checkWinner(xorList[index]) == "o") {
        setState(() {
          player2++;
        });
      }
    });
  }

  String? checkWinner(String index) {
    print(index);

    if (xorList[0] == index &&
        xorList[1] == index &&
        xorList[2] == xorList[0]) {
      return xorList[0];
    }

    if (xorList[3] == index &&
        xorList[4] == index &&
        xorList[5] == xorList[3]) {
      return index;
    }

    // row 3
    if (xorList[6] == index &&
        xorList[7] == index &&
        xorList[8] == xorList[6]) {
      return index;
    }

    //column 1
    if (xorList[0] == index &&
        xorList[3] == index &&
        xorList[6] == xorList[0]) {
      return index;
    }

    //column 2
    if (xorList[1] == index &&
        xorList[4] == index &&
        xorList[7] == xorList[1]) {
      return index;
    }

    //column 3
    if (xorList[2] == index &&
        xorList[5] == index &&
        xorList[8] == xorList[2]) {
      return index;
    }
  }
}

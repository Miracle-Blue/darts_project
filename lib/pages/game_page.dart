import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'BouncyPageRoute.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  static final String id = "game_page";

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double dartX = 0;
  double dartY = 1;

  double sizeHeight = 130;
  double sizeWeight = 130;

  late double targetX = 0;
  late double targetY;

  double ra = 0;
  int index = 1;
  int p = 15;
  late double x;

  List list = [];
  int _counter = 500;
  late Timer _timer;

  bool isTapped = false;

  void startTimer() {
      _counter = 500;
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if(_counter >= 1) {
        setState(() {
          _counter--;
        });
      } else {
        if (list.length == 11) {
          _showDialog();
        }
        _timer.cancel();
        setState(() {
          isTapped = false;
        });
      }
    });
  }

  void scoreAddFunction(int a) {
    if (list.length <= 10) {
      list.add(a);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoreAddFunction(p);
  }

  static TextStyle _textStyle(double size) {
    return TextStyle(
        fontSize: size, fontWeight: FontWeight.bold, color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    x = 380 / 675;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back_2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Center(
              child: Container(
                height: 675,
                width: 380,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(0, -0.8),
                      child: Stack(
                        alignment: AlignmentDirectional(0, 0),
                        children: [
                          CircleAvatar(
                            radius: 150,
                            backgroundColor: Colors.black,
                          ),
                          Positioned(
                              top: 2,
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                          CircleAvatar(
                            radius: 120,
                            backgroundColor: Colors.yellow,
                          ),
                          Positioned(
                              top: 30,
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              )),
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.red,
                          ),
                          Positioned(
                              top: 60,
                              child: Text(
                                "6",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                          ),
                          Positioned(
                              top: 93,
                              child: Text(
                                "8",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              )),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                          ),
                          Positioned(
                              top: 135,
                              child: Text(
                                "10",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment(targetX * 1 / x, dartY + 0.025),
                      child: Container(
                        child: Image.asset("assets/images/dart$index.png"),
                        width: sizeWeight,
                        height: sizeHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(30, 30),
                        backgroundColor: Color.fromRGBO(245, 75, 21, 1),
                        side: BorderSide(color: Colors.grey, width: 0),
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Image(
                        color: Colors.white,
                        width: 15,
                        height: 15,
                        image: AssetImage("assets/images/back_icon_2.png"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromRGBO(240, 12, 12, 0.92),
                              Color.fromRGBO(241, 153, 21, 0.7268)
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Score  :",
                              style: _textStyle(13),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            addListItem(list, 1),
                            addListItem(list, 2),
                            addListItem(list, 3),
                            addListItem(list, 4),
                            addListItem(list, 5),
                            addListItem(list, 6),
                            addListItem(list, 7),
                            addListItem(list, 8),
                            addListItem(list, 9),
                            addListItem(list, 10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(240, 12, 12, 0.92),
                          Color.fromRGBO(241, 153, 21, 0.7268)
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Total  :  ",
                          style: _textStyle(13),
                        ),
                        Expanded(
                            child: Text(
                          "${list.reduce((value, element) => value + element) - 15}",
                          style: _textStyle(13),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(240, 30, 12, 0.92),
                              Color.fromRGBO(240, 100, 12, 0.80)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(10),
                        height: 300,
                        width: 60,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            addListDartsArrow(list, 1),
                            addListDartsArrow(list, 2),
                            addListDartsArrow(list, 3),
                            addListDartsArrow(list, 4),
                            addListDartsArrow(list, 5),
                            addListDartsArrow(list, 6),
                            addListDartsArrow(list, 7),
                            addListDartsArrow(list, 8),
                            addListDartsArrow(list, 9),
                            addListDartsArrow(list, 10),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      isTapped
                          ? Container(
                              margin: EdgeInsets.all(10),
                              child: Image(
                                height: 80,
                                width: 80,
                                color: Colors.yellow,
                                image:
                                AssetImage("assets/images/throw_icon.png"),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTapped = true;
                                });
                                startTimer();
                                shoot();
                                waiting();
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image(
                                  height: 80,
                                  width: 80,
                                  color: Colors.yellow,
                                  image: AssetImage(
                                      "assets/images/throw_icon.png"),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget addListItem(List list, int index) {
    return Expanded(
        child: Text(
      "${list.length >= index + 1 ? list[index] : ""}",
      style: _GamePageState._textStyle(13),
    ));
  }

  Widget addListDartsArrow(List list, int number) {
    return Expanded(
      child: list.length >= number + 1
          ? Text("")
          : Image(
              height: 40,
              width: 40,
              image: AssetImage("assets/images/darts_arrow.png"),
            ),
    );
  }

  bool stop = false;

  void shoot() {
    stop = true;

    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        dartY -= 0.08;
        sizeHeight -= 2;
        sizeWeight -= 2;

        index++;

        if (index == 5) index = 3;

        if (stop) {
          targetX =
              ((Random().nextInt(5)) / 10) * pow(-1, Random().nextInt(10));
          targetY = ((Random().nextInt(5) + 2) / 10) * (-1);
          ra = sqrt(pow(((0) - (targetX)), 2) + pow(((-0.45) - (targetY)), 2));
          if (ra <= 0.09) {
            p = 10;
            scoreAddFunction(10);
          } else if (ra > 0.09 && ra <= 0.18) {
            p = 8;
            scoreAddFunction(8);
          } else if (ra > 0.18 && ra <= 0.27) {
            p = 6;
            scoreAddFunction(6);
          } else if (ra > 0.27 && ra <= 0.36) {
            p = 4;
            scoreAddFunction(4);
          } else if (ra > 0.36 && ra <= 0.45) {
            p = 2;
            scoreAddFunction(2);
          } else {
            p = 0;
            scoreAddFunction(0);
          }
        }
      });

      stop = false;
      if (dartY <= targetY) {
        dartY = targetY;
        index = 5;
        sizeHeight = 40;
        sizeWeight = 40;
        timer.cancel();
      }
    });
  }

  waiting() {
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        dartX = 0;
        dartY = 1;
        index = 1;
        sizeWeight = 130;
        sizeHeight = 130;
      });
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Stack(
          children: [
            SimpleDialog(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Color.fromRGBO(232, 175, 31, 0.53),
              children: [
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Text(
                    "TOTAL",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "${list.reduce((value, element) => value + element) - 15}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(232, 175, 31, 0.8),
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Image(image: AssetImage("assets/images/exit_img.png"),height: 20, width: 20,),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(232, 175, 31, 0.8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context, BouncyPageRoute(widget: GamePage()));
                      },
                      child: Icon(Icons.refresh, color: Colors.black,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
            Center(
              heightFactor: 2,
              child: Image(
                height: 180,
                width: 180,
                image: AssetImage("assets/images/final_darts_table.png"),
              ),
            ),
          ],
        );
      },
    );
  }
}
// app

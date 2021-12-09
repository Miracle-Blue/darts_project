import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  static final String id = "game_page";

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double dartX = 0;
  double dartY = 1;
  double sizeW = 120.0;
  double sizeH = 120.0;
  double ra = 0;
  double dartRanX = pow(-1, Random().nextInt(10)) * Random().nextDouble();
  double dartRanY = pow(-1, Random().nextInt(10)) * Random().nextDouble();
  int index = 1;
  int achko = 0;

  void shoot() {
    print("On tapped");
    Timer.periodic(const Duration(microseconds: 100), (timer) {
      setState(() {
        // index++;
        // dartY -= 0.005;
        // dartX -= (dartX-dartRanX)/100;
        // if(index == 3){
        //    index = 1;
        // }
        dartX = dartRanX;
        dartY = dartRanY;
      });
      // dartX = dartRanX;
      // if(dartY <= dartRanY ){
      //   timer.cancel();
      // }
    });
    ra = sqrt(pow(((-0.4) - (dartRanY)), 2) + pow(((-0.06) - (dartRanX)), 2));
    if (ra <= 0.085) {
      achko = 10;
    } else if (ra > 0.085 && ra <= 0.17) {
      achko = 8;
    } else if (ra > 0.17 && ra <= 0.27) {
      achko = 6;
    } else if (ra > 0.27 && ra <= 0.38) {
      achko = 4;
    } else if (ra > 0.38 && ra <= 0.48) {
      achko = 2;
    } else if (ra > 0.48 && ra <= 0.69) {
      achko = 1;
    } else {


      achko = 0;
    }
  }

  List list = [];

  void aa() {
    list.add(5);
    list.add(6);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aa();
  }

  static TextStyle _textStyle(double size) {
    return TextStyle(
        fontSize: size, fontWeight: FontWeight.bold, color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(list);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back_2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Column(
              // asdsfs
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
                Image(
                  image: AssetImage('assets/images/darts_table.png'),
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
                          "${list.reduce((value, element) => value + element)}",
                          style: _textStyle(13),
                        )),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
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
                      GestureDetector(
                        onTap: () {

                          shoot();
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image(
                            height: 80,
                            width: 80,
                            color: Colors.yellow,
                            image: AssetImage("assets/images/throw_icon.png"),
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
            Container(
              alignment: Alignment(dartX, dartY),
              child: Container(
                child: Image.asset("assets/images/dart1.png"),
                width: 120,
                height: 120,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget addListItem(List list, int index) {
  return Expanded(
      child: Text(
    "${list.length >= index ? list[index - 1] : ""}",
    style: _GamePageState._textStyle(13),
  ));
}

Widget addListDartsArrow(List list ,int number) {
  return Expanded(
    child: list.length>=number?
    Text(""):
    Image(
      height: 40,
      width: 40,
      image: AssetImage("assets/images/darts_arrow.png"),
    ),
  );
}

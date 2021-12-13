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
  // int qadam = 10;

  double dartRanX = ((Random().nextInt(5)) / 10) * pow(-1, Random().nextInt(10));
  double dartRanY = ((Random().nextInt(5)+3) / 10) * (-1);

  int index = 1;
  int p = 15;
  double rukaY = 1;
  double x = 0;
  List list = [];

  void scoreAddFunction(int a) {
    list.add(a);
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
    x= (width)/height;

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
                  height: 800,
                  width: 400,
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment(0, -0.67),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            CircleAvatar(
                              radius: 140,
                              backgroundColor: Colors.black,
                            ),
                            Positioned(
                                top: 2,
                                child: Text(
                                  "2",
                                  style: TextStyle(fontSize: 25, color: Colors.white),
                                )),
                            CircleAvatar(
                              radius: 110,
                              backgroundColor: Colors.yellow,
                            ),
                            Positioned(
                                top: 30,
                                child: Text(
                                  "4",
                                  style: TextStyle(fontSize: 25, color: Colors.black),
                                )),
                            CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.red,
                            ),
                            Positioned(
                                top: 60,
                                child: Text(
                                  "6",
                                  style: TextStyle(fontSize: 25, color: Colors.white),
                                )),
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.yellow,
                            ),
                            Positioned(
                                top: 93,
                                child: Text(
                                  "8",
                                  style: TextStyle(fontSize: 25, color: Colors.black),
                                )),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                            ),
                            Positioned(
                                top: 127,
                                child: Text(
                                  "10",
                                  style: TextStyle(fontSize: 25, color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        //dartX*(1/x)
                        alignment: Alignment((1/x)*dartX, dartY),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.white,
                        )
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
              ]
            ),
          ),
        ),
    );
  }

  Widget addListItem(List list, int index) {
    return Expanded(
        child: Text(
          // qo'shish
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

  bool stop=false;


  void shoot() {
       stop=true;
    print("On tapped");
    Timer.periodic(const Duration(microseconds: 100), (timer) {
      setState(() {
        dartX = (1/x)*((Random().nextInt(5)) / 10) * pow(-1, Random().nextInt(10));
        dartY = ((Random().nextInt(5)+2) / 10) * (-1);

      });
      // dartX = dartRanX;
      // if(dartY <= dartRanY ){
      //   timer.cancel();
      // }


     if(stop){
       ra = sqrt(pow(((0) - ((1/x)*((Random().nextInt(5)) / 10) * pow(-1, Random().nextInt(10)))), 2) + pow(((-0.39) - (((Random().nextInt(5)+3) / 10) * (-1))), 2));
       if (ra <= 0.06) {
         p = 10;
         scoreAddFunction(10);
       } else if (ra > 0.06 && ra <= 0.15) {
         p = 8;
         scoreAddFunction(8);
       } else if (ra > 0.15 && ra <= 0.245) {
         p = 6;
         scoreAddFunction(6);
       } else if (ra > 0.245 && ra <= 0.336) {
         p = 4;
         scoreAddFunction(4);
       } else if (ra > 0.336 && ra <= 0.43) {
         p = 2;
         scoreAddFunction(2);
       } else {
         p = 0;
         scoreAddFunction(0);
       }

     }
      stop=false;
      Future.delayed(Duration(seconds: 5));
      setState(() {
        dartX=0;
        dartY=1;
      });
    });





  }

  // Future<void> qayting() async {
  //   if(qadam > 0){
  //     dartX = 0;
  //     dartY = 1;
  //     qadam--;
  //   }
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  static final String id = "game_page";

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
    print(list);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back_2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
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
              Row(
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
                        addListDartsArrow(list,1),
                        addListDartsArrow(list,2),
                        addListDartsArrow(list,3),
                        addListDartsArrow(list,4),
                        addListDartsArrow(list,5),
                        addListDartsArrow(list,6),
                        addListDartsArrow(list,7),
                        addListDartsArrow(list,8),
                        addListDartsArrow(list,9),
                        addListDartsArrow(list,10),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
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

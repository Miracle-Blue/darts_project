import 'package:darts/pages/game_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final String id = "home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/home_img.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Darts B-14",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 360,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  padding: EdgeInsets.only(
                      right: 40, left: 40, top: 10, bottom: 10)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, GamePage.id);
              },
              child: Text(
                "Start",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:darts/pages/game_page.dart';
import 'package:darts/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static final String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.asset("assets/videos/intro_vid.mp4")
      ..initialize().then((value) {
        _controller.play();
        _controller.setPlaybackSpeed(1.7);
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 255, 1),
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(-70.0, 0.0),
            child: Transform.rotate(
              angle: 0.0,
              child: SizedBox.expand(
                child: FittedBox(
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(),
            child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              onPressed: () {
                _controller.dispose();
                Navigator.pushReplacementNamed(context, GamePage.id);
              },
              child: Text(
                "Play",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



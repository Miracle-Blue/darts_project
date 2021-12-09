// import 'package:darts/pages/game_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   static final String id = "home_page";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage("assets/images/home_img.jpg"),
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 120,
//             ),
//             Container(
//                 decoration: BoxDecoration(
//                     color: Color.fromRGBO(193, 149, 34, 0.85),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 8, bottom: 8, right: 20, left: 20),
//                   child: Text(
//                     "Dart B_14",
//                     style: TextStyle(color: Colors.white,fontSize: 35, fontWeight: FontWeight.bold),
//                   ),
//                 )),
//             SizedBox(height: 450,),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Color.fromRGBO(193, 110, 1, 1),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(17)),
//                     padding: EdgeInsets.only(
//                         right: 40, left: 40, top: 10, bottom: 10)),
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, GamePage.id);
//                 },
//                 child: Text(
//                   "Start",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

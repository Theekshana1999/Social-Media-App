import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login/utils/color_utils.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        color: hexStringToColor("#8385FF"),
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.favorite, size: 30,),
          Icon(Icons.chat, size: 30),
          Icon(Icons.add_circle, size: 30),
          Icon(Icons.request_page, size: 30),
          // FUI(SolidRounded.HEART,color: Colors.red)
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          print("$index");
          
          //Handle button tap
        },
      ),
      body: Column(
        children: [
          Container(
            child: Text("Home Screen"),
          )
        ],
      ),
    );
  }
}

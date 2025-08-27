import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ],
      ),
    );
  }
}

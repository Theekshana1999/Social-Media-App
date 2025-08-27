import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login/Widgets/ProfileCard.dart';
import 'package:login/utils/color_utils.dart';
import '../models/person.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const persons = [
    Person(
      name: 'Chathuri',
      gender: 'Female',
      age: 25,
      district: 'Colombo',
      maritalStatus: 'Single',
      likes: 100,
      imageAsset: 'assets/images/Chathuri.png', // <-- asset path
      timeAgo: '5 min ago',
    ),
    Person(
      name: 'Ishara Sewwandi',
      gender: 'Female',
      age: 30,
      district: 'Galle',
      maritalStatus: 'Unmarried',
      likes: 200,
      imageAsset: 'images/ishara.jpg',
      timeAgo: '10 min ago',
    ),
    Person(
      name: 'Nishu Gunasekara',
      gender: 'Female',
      age: 30,
      district: 'Mawanella',
      maritalStatus: 'Unmarried',
      likes: 200,
      imageAsset: 'images/Nishu.jpg',
      timeAgo: '10 min ago',
    ),
    Person(
      name: 'Tharuka Sewmini',
      gender: 'Female',
      age: 30,
      district: 'Mawanella',
      maritalStatus: 'Unmarried',
      likes: 320,
      imageAsset: 'images/tharuka.jpg',
      timeAgo: '10 min ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        color: hexStringToColor("#8385FF"),
        backgroundColor: Colors.transparent,

        items: const <Widget>[
          Icon(Icons.favorite, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.add_circle, size: 30),
          Icon(Icons.request_page, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          // Handle tab taps
          print(index);
        },
      ),
      // 🔍 Search bar always at top
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        children: [
          // // 🔍 Static Search Bar
          // SizedBox(
          //   height: 40,
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Search',
          //       suffixIcon: const Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(15.0),
          //         borderSide: BorderSide.none,
          //       ),
          //       filled: true,
          //       fillColor: Colors.grey[200],
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 12),

          // Use the reusable card
          for (final p in persons)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProfileCard(person: p),
            ),
        ],
      ),
    );
  }
}

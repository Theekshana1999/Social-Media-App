import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login/Screen/person_detail_Page.dart';

import '../models/person.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  List<Person> Request = [
  Person(
    name: 'Chathuri',
    gender: 'Female',
    age: 25,
    district: 'Colombo',
    maritalStatus: 'Single',
    likes: 100,
    imageAsset: 'assets/images/Chathuri.png',
    timeAgo: '5 min ago',
  ),
  Person(
    name: 'Ishara Sewwandi',
    gender: 'Female',
    age: 30,
    district: 'Galle',
    maritalStatus: 'Unmarried',
    likes: 200,
    imageAsset: 'assets/images/Ishara.jpg',
    timeAgo: '10 min ago',
  ),
  Person(
    name: 'Nishu Gunasekara',
    gender: 'Female',
    age: 30,
    district: 'Mawanella',
    maritalStatus: 'Unmarried',
    likes: 200,
    imageAsset: 'assets/images/Nishu.jpg',
    timeAgo: '10 min ago',
  ),
  Person(
    name: 'Tharuka Sewmini',
    gender: 'Female',
    age: 30,
    district: 'Mawanella',
    maritalStatus: 'Unmarried',
    likes: 320,
    imageAsset: 'assets/images/Tharuka.jpg',
    timeAgo: '10 min ago',
  ),
];


  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemCount: Request.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                leading: CircleAvatar(
                  radius: 24,
                  // ignore: unnecessary_null_comparison
                  backgroundImage: Request[index].imageAsset != null
                      ? AssetImage(Request[index].imageAsset)
                      : AssetImage('assets/images/default_avatar.png')
                          as ImageProvider,
                ),
                title: Text(
                  Request[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(" Request Accepted");
                        // Accept friend request logic
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF00EB78),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Accept",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        print(" Request Declined");
                        // Decline friend request logic
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Decline",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PersonDetailPager(
                          persons: Request,
                          initialIndex: index,
                        ),
                      ),
                    );
                  
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

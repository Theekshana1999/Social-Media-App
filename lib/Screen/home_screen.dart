import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login/utils/color_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const persons = [
    {
      'name': 'Chathuri',
      'gender': 'Female',
      'age': 25,
      'district': 'Colombo',
      'maritalStatus': 'Single',
      'likes': 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        color: hexStringToColor("#8385FF"),
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.favorite, size: 30),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      height: 175,
                      width: 175,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: AssetImage('/images/Chathuri.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 5),
                              Text("Name : ${persons[0]['name']}"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.wc),
                              SizedBox(width: 5),
                              Text("Gender : ${persons[0]['gender']}"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.cake),
                              SizedBox(width: 5),
                              Text("Age : ${persons[0]['age']}"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 5),
                              Text("District : ${persons[0]['district']}"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.group),
                              SizedBox(width: 5),
                              Text(
                                "Marital Status : ${persons[0]['maritalStatus']}",
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                      
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.chat),
                              ),
                              Icon(Icons.favorite, color: Colors.red),
                              Text(
                                "${persons[0]['likes']}\nLikes",
                                style: TextStyle(fontSize: 8),
                              ),
                      
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 12),
                                      Text(
                                        "5 min ago",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "See more",
                                    style: TextStyle(
                                      backgroundColor: Colors.grey[200],
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


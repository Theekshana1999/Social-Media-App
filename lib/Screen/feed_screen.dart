import 'package:flutter/material.dart';
import 'package:login/Screen/person_detail_Page.dart';
import 'package:login/Widgets/ProfileCard.dart';
import 'package:login/models/person.dart';

const persons = [
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

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
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
                fillColor: Colors.grey[200],
              ),
            ),
          ),
        ),

        // Lazy list builder
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final p = persons[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PersonDetailPager(
                          persons: persons,
                          initialIndex: index,
                        ),
                      ),
                    );
                  },
                  child: ProfileCard(person: p),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

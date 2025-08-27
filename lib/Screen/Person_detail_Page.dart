import 'package:flutter/material.dart';

import '../models/person.dart';
class PersonDetailScreen extends StatelessWidget {
  final Person person;

  const PersonDetailScreen({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(person.imageAsset),
            const SizedBox(height: 12),
            Text('Name: ${person.name}'),
            Text('Gender: ${person.gender}'),
            Text('Age: ${person.age}'),
            Text('District: ${person.district}'),
            Text('Marital Status: ${person.maritalStatus}'),
            Text('Likes: ${person.likes}'),
            Text('Time Ago: ${person.timeAgo}'),
          ],
        ),
      ),
    );
  }
}
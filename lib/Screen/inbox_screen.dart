import 'package:flutter/material.dart';
import 'package:login/Screen/chat_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final List<String> users = [
    "Alex Johnson",
    "Sophia Williams",
    "Ethan Brown",
    "Olivia Taylor",
    "Liam Anderson",
    "Emma Thomas",
    "Noah White",
    "Ava Harris",
    "James Martin",
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredUsers =
        users
            .where(
              (user) => user.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    return Scaffold(
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // User list
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    filteredUsers[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "Last message preview...",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "12:30 PM",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        child: Text(
                          "2",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ChatScreen(userName: filteredUsers[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pinkAccent, title: Text(title)),
      body: Center(
        child: Text('$title Page', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}

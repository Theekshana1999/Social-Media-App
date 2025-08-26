import 'package:flutter/material.dart';

class RequstScreen extends StatelessWidget {
  const RequstScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Profile',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const OutBoxScreen(),
      routes: {
        '/profile': (context) => const PlaceholderPage(title: 'My Profile'),
        '/favorite': (context) => const PlaceholderPage(title: 'Favorite'),
        '/outbox': (context) => const OutBoxScreen(),
        '/inbox': (context) => const PlaceholderPage(title: 'Inbox'),
      },
    );
  }
}

class OutBoxScreen extends StatefulWidget {
  const OutBoxScreen({super.key});

  @override
  State<OutBoxScreen> createState() => _OutBoxScreenState();
}

class _OutBoxScreenState extends State<OutBoxScreen> {
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
    "Mia Clark",
  ];

  String searchQuery = "";
  int selectedIndex = 2; // Outbox selected

  @override
  Widget build(BuildContext context) {
    final filteredUsers = users
        .where((user) => user.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "Outbox",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      drawer: AppDrawer(
        currentIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          Navigator.pop(context); // Close the drawer
        },
      ),
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
                    "Last sent message preview...",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "12:30 PM",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to message details
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          // Navigation handling
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/profile');
              break;
            case 1:
              Navigator.pushNamed(context, '/favorite');
              break;
            case 2:
              // Already on Outbox
              break;
            case 3:
              Navigator.pushNamed(context, '/inbox');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "My profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_outlined),
            label: "Outbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: "Inbox",
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const AppDrawer({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pinkAccent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.pinkAccent),
                ),
                SizedBox(height: 10),
                Text(
                  'Messaging App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'user@example.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person_outline,
            title: 'My Profile',
            index: 0,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.favorite_border,
            title: 'Favorite',
            index: 1,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.send_outlined,
            title: 'Outbox',
            index: 2,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.mail_outline,
            title: 'Inbox',
            index: 3,
          ),
          const Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.settings,
            title: 'Settings',
            index: 4,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.help_outline,
            title: 'Help & Feedback',
            index: 5,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.exit_to_app,
            title: 'Sign Out',
            index: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = index == currentIndex && index < 4;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.pinkAccent : Colors.grey.shade700,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.pinkAccent : Colors.grey.shade700,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.pinkAccent.withOpacity(0.1),
      onTap: () {
        if (index < 4) {
          onItemSelected(index);
        } else {
          // Handle other menu items
          Navigator.pop(context);
          switch (index) {
            case 4:
              // Settings
              break;
            case 5:
              // Help
              break;
            case 6:
              // Sign out
              break;
          }
        }
      },
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

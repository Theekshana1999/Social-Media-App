import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Screen/add_post.dart';
import 'package:login/Screen/feed_screen.dart';
import 'package:login/Screen/inbox_screen.dart';
import 'package:login/Screen/myprofile_screen.dart';
import 'package:login/controllers/navbar_Controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavController navController = Get.put(NavController());

  /// Lazily load pages (instead of pre-building all)
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const Feed(); // Home feed
      case 1:
        return const AddPostScreen();
      case 2:
        return const InboxScreen();
      case 3:
        return const MyProfilePage();
      default:
        return const Feed();
    }
  }

  AppBar buidDynamicAppBar(int index) {
    switch (index) {
      case 0:
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            "Feed",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      case 1:
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            "Add Post",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      case 2:
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            "Inbox",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      case 3:
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            "My Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.pinkAccent,
          title: const Text("Social Media App"),
        );
    }
  }

  int selectedIndex = 3; // Inbox selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        currentIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          Navigator.pop(context); // Close the drawer
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(() => buidDynamicAppBar(navController.selectedIndex.value)),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          index: navController.selectedIndex.value,
          color: const Color(0xFF8385FF),
          backgroundColor: Colors.transparent,
          height: 60,
          items: const <Widget>[
            Icon(Icons.favorite, size: 30),
            Icon(Icons.add_circle, size: 30),
            Icon(Icons.chat, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: navController.changeIndex,
        ),
      ),
      body: Obx(() => getPage(navController.selectedIndex.value)),
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
                  'Welcome User',
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

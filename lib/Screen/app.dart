import 'package:flutter/material.dart';

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
          _buildDrawerItem(context, Icons.person_outline, 'My Profile', 0),
          _buildDrawerItem(context, Icons.favorite_border, 'Favorite', 1),
          _buildDrawerItem(context, Icons.send_outlined, 'Outbox', 2),
          _buildDrawerItem(context, Icons.mail_outline, 'Inbox', 3),
          const Divider(),
          _buildDrawerItem(context, Icons.settings, 'Settings', 4),
          _buildDrawerItem(context, Icons.help_outline, 'Help & Feedback', 5),
          _buildDrawerItem(context, Icons.exit_to_app, 'Sign Out', 6),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title,
    int index,
  ) {
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
          Navigator.pop(context);
          switch (index) {
            case 4:
              break; // Settings
            case 5:
              break; // Help
            case 6:
              break; // Sign out
          }
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

class CustomerSidebar extends StatelessWidget {
  const CustomerSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Shahabuddin",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            accountEmail: const Text(
              "shavoddin54@gmail.com",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Account settings"),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add),
            title: const Text("Add a notes"),
            onTap: () {
              Navigator.pushNamed(context, '/add-note');
            },
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: const Text("View notes"),
            onTap: () => Navigator.pushNamed(context, '/view-notes'),
          ),
          ListTile(
            leading: const Icon(Icons.file_copy),
            title: const Text("Files"),
            onTap: () => Navigator.pushNamed(context, '/file'),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Login"),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

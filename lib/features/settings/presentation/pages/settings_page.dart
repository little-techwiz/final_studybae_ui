import 'package:flutter/material.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primaryColor,
                  width: 3.0,
                ),
              )
          ),
          child: Text(
            "Settings",
            style: appTextTheme(context).titleMedium,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 40),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.white),
              title: const Text("View history"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.chat, color: Colors.white),
              title: const Text("Chat with AI"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text("About us"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.white),
              title: const Text("Contact Us"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text("Log out"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
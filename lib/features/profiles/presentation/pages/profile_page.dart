import 'package:flutter/material.dart';
import 'package:studybae/core/configs/theme/app_colours.dart';
import 'package:studybae/core/utils/constants.dart';
import 'package:studybae/core/utils/route.dart';
import 'package:studybae/core/widgets/bottomNavigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  //Navigaton through pages section
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      //Handling navigation to different pages
      if(index !=3){
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, homePage);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, studyPage);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, downloadPage);
            break;
          case 3:
            break;
        }
      }
    });
  }

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
            "My Profile",
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
                    Text("513/03028/23"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.brightness_4, color: Colors.white),
              title: const Text("Theme Settings"),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.white),
              title: const Text("Activate Account"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pushNamed(context, settingsPage);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}

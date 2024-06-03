
import 'package:eventa_project/color.dart';
import 'package:flutter/material.dart';



class CustomDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    // {'icon': Icons.home, 'title': 'Home', 'page': HomePage()},
    // {'icon': Icons.person, 'title': 'Profile', 'page': ProfilePage()},
    // {'icon': Icons.settings, 'title': 'Settings', 'page': SettingsPage()},
    // {'icon': Icons.info, 'title': 'About', 'page': AboutPage()},
    // {'icon': Icons.logout, 'title': 'Logout', 'page': LogoutPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png',),
            ),
            decoration: BoxDecoration(
              color:Appcolor.appBar,
            ),
          ),
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']));
                Navigator.pop(context);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
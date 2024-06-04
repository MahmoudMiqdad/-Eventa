
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:eventa_project/view/screen/rating%20page/rating_page.dart';
import 'package:flutter/material.dart';



class CustomDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'title': 'Home', 'page': HomePage()},
    {'icon': Icons.rate_review, 'title': 'Rating', 'page': RatingPage()},
    // {'icon': Icons.settings, 'title': 'Settings', 'page': },
    // {'icon': Icons.info, 'title': 'About', 'page': AboutPage()},
    // {'icon': Icons.logout, 'title': 'Logout', 'page': LogoutPage()},
  ];

   CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            
            accountName: Text("MAHMOUD"),
            accountEmail: Text("MAHMOUD@gmile.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png',),
            ),
            decoration: BoxDecoration(
              color:Appcolor.appBar,
            ),
          ),
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon'],color: Appcolor.mainColor,),
              title: Text(item['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']));
                
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
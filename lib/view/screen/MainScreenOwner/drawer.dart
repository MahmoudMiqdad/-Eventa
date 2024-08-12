import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('اسم المستخدم'),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('On / Off'),
              trailing: Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('عرض الحجوزات'),
              onTap: () {
                // قم بإضافة الوظيفة هنا
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('مرحبًا بك في الشاشة الرئيسية!'),
      ),
    );
  }
}

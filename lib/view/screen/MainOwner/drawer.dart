import 'package:eventa_project/view/screen/MainOwner/buill.dart';
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
        title: const Text('Home Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('اسم المستخدم'),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                   AssetImage('assets/images/logo.png')
              ),
            ),
           
          
             ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Bill '),
              onTap: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BillOwner(
                                     
                                          )),
                                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('مرحبًا بك في الشاشة الرئيسية!'),
      ),
    );
  }
}

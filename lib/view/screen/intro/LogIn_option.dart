
import 'package:eventa_project/view/screen/LogIn/Hall_LogIn.dart';
import 'package:eventa_project/view/screen/LogIn/Owner_LogIn.dart';
import 'package:eventa_project/view/screen/LogIn/User_LogIn.dart';
import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login As  ',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 236, 236, 236),
          ),
        ),
      ),
      body: Center(






        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 70),
            const SizedBox(
              height: 100,
              width: 250,
              child: Image(
                image: const AssetImage('assets/images/eventa.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Eventa',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 230, // حدد العرض الذي تريده هنا
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            const SizedBox(height: 40),
            buildElevatedButton(
                'User                      ', Icons.supervised_user_circle, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => User_LogIn()),
              );
            }),
            const SizedBox(height: 20),
            buildElevatedButton('Hall                       ', Icons.house, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HallLogIn()),
              );
            }),
            const SizedBox(height: 20),
            buildElevatedButton('Owner                    ', Icons.design_services, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OwnerLogin()),
              );
            }),
            const SizedBox(height: 20),
            buildElevatedButton(
                'Exit                       ', Icons.exit_to_app, () {
                
              SystemNavigator.pop();
            
                  
                }),
          ],
        ),
      ),
    );
  }
}

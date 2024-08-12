
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
        title: Text(
          'Login As  ',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 236, 236, 236),
          ),
        ),
      ),
      body: Center(






        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70),
            SizedBox(
              height: 100,
              width: 250,
              child: Image(
                image: AssetImage('assets/images/eventa.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Text(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            SizedBox(height: 40),
            buildElevatedButton(
                'User                      ', Icons.supervised_user_circle, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => User_LogIn()),
              );
            }),
            SizedBox(height: 20),
            buildElevatedButton('Hall Owner           ', Icons.house, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Hall_LogIn()),
              );
            }),
            SizedBox(height: 20),
            buildElevatedButton('Service Provider ', Icons.design_services, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Owner_LogIn()),
              );
            }),
            SizedBox(height: 20),
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


import 'package:eventa_project/view/screen/LogIn/Hall_LogIn.dart';
import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';

class Hall_Signup extends StatefulWidget {
  @override
  Hall_SignupState createState() => Hall_SignupState();
}

class Hall_SignupState extends State<Hall_Signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 1),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80), // يمكنك تعديل المسافة حسب الحاجة
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/images/eventa.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20), // يمكنك تعديل المسافة حسب الحاجة
                Align(
                  alignment: Alignment.centerLeft, // لوضع النص في اليسار
                  child: Text(
                    'Enter your Hall info',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(height: 20),
                buildTextField(Icons.person, 'Name', 'Name', true),
                SizedBox(height: 20),
                buildTextField(Icons.location_city, 'Address', 'Address', true),
                SizedBox(height: 20),
                buildTextField(
                    Icons.text_snippet, 'Description', 'Description', true),
                SizedBox(height: 20),
                buildTextField(
                    Icons.phone, 'Phone Number', 'Phone Number', true),
                SizedBox(height: 20),
                buildTextField(Icons.email, 'E-mail', 'E-mail', true),
                SizedBox(height: 20),
                buildTextField(Icons.key, 'Your Password', 'Password', true),
                SizedBox(height: 20),
                buildTextField(
                    Icons.key, 'Confirm Password', 'Retype Password', true),

                SizedBox(height: 20),

                buildElevatedButton(
                    'SIGN UP', Icons.arrow_circle_right_outlined, () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Attention'),
                        content: Text(
                            'make sure you save your password and email and click OK to go login page '),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // إغلاق المربع الحواري
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Hall_LogIn()),
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }),

                SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}

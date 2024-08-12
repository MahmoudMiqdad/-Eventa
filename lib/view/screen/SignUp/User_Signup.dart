import 'package:eventa_project/view/screen/LogIn/User_LogIn.dart';
import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';

class Createaccount extends StatefulWidget {
  @override
  _CreateaccountState createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 1),
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
                    'Sign up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
        
                Row(
                  children: <Widget>[
                    Expanded(
                      child: buildTextField(Icons.person, 'Name', 'Name', true),
                    ),
                    SizedBox(width: 10), // مسافة بين الحقول
                    Expanded(
                      child: buildTextField(
                          Icons.text_decrease, 'Last Name', 'Last Name', true),
                    ),
                  ],
                ),
                SizedBox(height: 20),
        
                buildTextField(Icons.phone, 'Phone Number', 'Phone Number', true),
                SizedBox(height: 20),
                buildTextField(Icons.email, 'E-mail', 'E-mail', true),
                SizedBox(height: 20),
                buildTextField(Icons.key, 'Your Password', 'Password', true),
                SizedBox(height: 20),
                buildTextField(
                    Icons.key, 'Confirm Password', 'Retype Password', true),
        
                SizedBox(height: 20),
        
                SizedBox(height: 20),
        
                ElevatedButton(
                  onPressed: () {
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
                                      builder: (context) => User_LogIn()),
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // لضمان توسيط المحتوى داخل الزر
                    children: <Widget>[
                      SizedBox(width: 10), // تقليل المسافة بين الأيقونة والنص
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 20, // حجم الخط أكبر
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10), // تقليل المسافة بين الأيقونة والنص
                      Icon(
                        Icons.arrow_circle_right_outlined, // أيقونة السهم
                        color: Colors.white,
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF5669FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // حواف منحنية
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10), // تقليل حجم الزر
                  ),
                )
              ],
            )),
      ),
    );
  }
}

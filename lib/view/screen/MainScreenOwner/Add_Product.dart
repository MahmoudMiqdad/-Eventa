import 'dart:io';

import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';

class Add_Product extends StatefulWidget {
  @override
  Add_ProductState createState() => Add_ProductState();
}

class Add_ProductState extends State<Add_Product> {
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
                    image: AssetImage('images/eventa1.png'),
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20), // يمكنك تعديل المسافة حسب الحاجة
                Align(
                  alignment: Alignment.centerLeft, // لوضع النص في اليسار
                  child: Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('images/eventa1.png'),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () async {},
                            child: Container(
                              height: 50,
                              width: 50,
                             
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                buildTextField(Icons.person, 'Name', 'Name', true),
                SizedBox(height: 20),
                buildTextField(Icons.location_city, 'Price', 'Price', true),
                SizedBox(height: 20),

                SizedBox(height: 20),

                buildElevatedButton('Save ', Icons.arrow_circle_right_outlined,
                    () {
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Hall_LogIn()),
                              // );
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

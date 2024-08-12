
import 'package:eventa_project/view/screen/LogIn/Owner_LogIn.dart';
import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';

class OwnerSignup extends StatefulWidget {
  @override
  _OwnerSignupState createState() => _OwnerSignupState();
}

class _OwnerSignupState extends State<OwnerSignup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  String _selectedItem = "Cars";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 80), // يمكنك تعديل المسافة حسب الحاجة
                const SizedBox(
                  height: 100,
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/images/eventa.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20), // يمكنك تعديل المسافة حسب الحاجة
                const Align(
                  alignment: Alignment.centerLeft, // لوضع النص في اليسار
                  child: Text(
                    'Enter your service info',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  width: 390, // عرض الزر
                  height: 50, // ارتفاع الزر
                  padding: const EdgeInsets.symmetric(horizontal: 20), // إضافة حشوة
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // إضافة حدود
                    borderRadius:
                        BorderRadius.circular(40), // إضافة زوايا مستديرة
                  ),
                  child: DropdownButton<String>(
                    value: _selectedItem,
                    items: [
                      const DropdownMenuItem<String>(
                        value: 'Cars',
                        child: Text('Cars'),
                      ),
                      const DropdownMenuItem<String>(
                        value: 'Restaurant',
                        child: Text('Restaurant'),
                      ),
                      const DropdownMenuItem<String>(
                        value: 'Music',
                        child: Text('Music'),
                      ),
                      const DropdownMenuItem<String>(
                        value: 'Show Band',
                        child: Text('Show Band'),
                      ),
                      // أضف المزيد من العناصر هنا
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = (value)!;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(height: 20),
                buildTextField(Icons.person, 'Name', 'Name', true),
                const SizedBox(height: 20),
                buildTextField(Icons.location_city, 'Address', 'Address', true),
                const SizedBox(height: 20),
                buildTextField(
                    Icons.text_snippet, 'Description', 'Description', true),
                const SizedBox(height: 20),
                buildTextField(
                    Icons.phone, 'Phone Number', 'Phone Number', true),
                const SizedBox(height: 20),
                buildTextField(Icons.email, 'E-mail', 'E-mail', true),
                const SizedBox(height: 20),
                buildTextField(Icons.key, 'Your Password', 'Password', true),
                const SizedBox(height: 20),
                buildTextField(
                    Icons.key, 'Confirm Password', 'Retype Password', true),

                const SizedBox(height: 20),

                buildElevatedButton(
                    'SIGN UP', Icons.arrow_circle_right_outlined, () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Attention'),
                        content: const Text(
                            'make sure you save your password and email and click OK to go login page '),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // إغلاق المربع الحواري
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Owner_LogIn()),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }),

                const SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}

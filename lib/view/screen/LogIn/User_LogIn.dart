
import 'package:eventa_project/view/screen/SignUp/User_Signup.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:flutter/material.dart';

class User_LogIn extends StatefulWidget {
  @override
  User_LogInState createState() => User_LogInState();
}

class User_LogInState extends State<User_LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

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
              const Text(
                'Eventa',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60), // يمكنك تعديل المسافة حسب الحاجة
              const Align(
                alignment: Alignment.centerLeft, // لوضع النص في اليسار
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
          
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'abc@email.com',
                  labelText: 'email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
          
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(Icons.key),
                  hintText: 'Your password',
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 0.5),
          
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 2), // مسافة بين الأزرار
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          // هنا يمكنك تنفيذ الوظيفة عند الضغط على الزر
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Color.fromARGB(255, 110, 102, 102),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(flex: 1,) ,// مسافة بين الأزرار
                      const Text(
                        '||',
                        style: TextStyle(
                          color: Color(0xFF5669FF),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Spacer(flex: 1,) ,
          
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Createaccount()),
                          );
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            color: Color.fromARGB(255, 110, 102, 102),
                            // fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                    },
                    child: const Row(
                      mainAxisSize:
                          MainAxisSize.min, // لضمان توسيط المحتوى داخل الزر
                      children: <Widget>[
                        SizedBox(width: 10), // تقليل المسافة بين الأيقونة والنص
                        Text(
                          'SIGN IN',
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
                      backgroundColor: const Color(0xFF5669FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // حواف منحنية
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10), // تقليل حجم الزر
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

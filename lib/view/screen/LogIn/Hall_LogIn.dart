import 'package:eventa_project/view/screen/LogIn/cubit/cubit.dart';
import 'package:eventa_project/view/screen/LogIn/cubit/states.dart';
import 'package:eventa_project/view/screen/SignUp/Hall_Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallLogIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  HallLogIn({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LogInCubit(),
        child: BlocConsumer<LogInCubit, LogInState>(
            listener: (context, state) {},
            builder: (context, state) {
              var login = LogInCubit.get(context);

              return Scaffold(
                //key: login.loginValidator,

                body: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
                  child: SingleChildScrollView(
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: login.loginValidator,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 80),
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
                          const SizedBox(height: 60),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Login As Hall',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (value) {
                              if (value == null) {
                                return "error";
                              }
                              return null;
                            },
                            controller: login.emailController,
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
                          TextFormField(
                            validator: (value) {
                              if (value == null) {
                                return "error";
                              }
                              return null;
                            },
                            controller: login.passwordController,
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
                              const SizedBox(height: 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 110, 102, 102),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  const Text(
                                    '||',
                                    style: TextStyle(
                                      color: Color(0xFF5669FF),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HallSignup()),
                                      );
                                    },
                                    child: const Text(
                                      'Create Account',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 110, 102, 102),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () async {
                                  print(login.loginValidator.currentState!
                                      .validate());
                                  if (login.loginValidator.currentState!
                                      .validate()) {
                                    await login.loginhall(
                                        email: login.emailController.text
                                            .toString(),
                                        password: login.passwordController.text
                                            .toString(),
                                        context: context);
                                    //  Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //               builder: (context) => HomePage()),
                                    //         );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color(0xFF5669FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // حواف منحنية
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 10), // تقليل حجم الزر
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize
                                      .min, // لضمان توسيط المحتوى داخل الزر
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            10), // تقليل المسافة بين الأيقونة والنص
                                    Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                        fontSize: 20, // حجم الخط أكبر
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            10), // تقليل المسافة بين الأيقونة والنص
                                    Icon(
                                      Icons
                                          .arrow_circle_right_outlined, // أيقونة السهم
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

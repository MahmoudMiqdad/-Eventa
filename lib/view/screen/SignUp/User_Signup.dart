import 'package:eventa_project/view/screen/SignUp/cubit/cubit.dart';
import 'package:eventa_project/view/screen/SignUp/cubit/states.dart';
import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  _CreateaccountState createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var register = RegisterCubit.get(context);
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 1),
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
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: buildTextField(
                                    controller: register.userInfoControllers
                                        .firstnameController,
                                    errorText: 'Please enter your name',
                                    validator: register
                                        .userInfoValidators.firstnameValidator,
                                    icon: Icons.person,
                                    labelText: 'Name',
                                    hintText: 'Name'),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: buildTextField(
                                    controller: register
                                        .userInfoControllers.lastnameController,
                                    errorText: 'Please enter your lastname',
                                    validator: register
                                        .userInfoValidators.lastnameValidator,
                                    icon: Icons.text_decrease,
                                    hintText: 'Last Name',
                                    labelText: 'Last Name'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          buildTextField(
                              controller:
                                  register.userInfoControllers.phoneController,
                              errorText: 'Please enter your Phone',
                              icon: Icons.phone,
                              hintText: 'Phone Number',
                              labelText: 'Phone Number',
                              validator:
                                  register.userInfoValidators.phoneValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              controller:
                                  register.userInfoControllers.emailController,
                              errorText: 'Please enter your Phone',
                              icon: Icons.email,
                              hintText: 'E-mail',
                              labelText: 'E-mail',
                              validator:
                                  register.userInfoValidators.emailValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              controller: register
                                  .userInfoControllers.passwordController,
                              errorText: 'Please enter your Phone',
                              icon: Icons.key,
                              hintText: 'Your Password',
                              labelText: 'Password',
                              validator: register
                                  .userInfoValidators.passwordValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              controller: register.userInfoControllers
                                  .passwordConfirmationController,
                              errorText: 'Please enter your Phone',
                              icon: Icons.key,
                              hintText: 'Confirm Password',
                              labelText: 'Retype Password',
                              validator: register.userInfoValidators
                                  .passwordConfirmationValidator),
                          const SizedBox(height: 20),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
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
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          print('--------------------------- on pressed');
                                          //register.register(context: context, name: name, lastname: lastname, email: email, configpas: configpas, password: password, phone: phone);
                                          register.registerUser(
                                              context: context,
                                              name: register.userInfoControllers
                                                  .firstnameController.text,
                                              lastname: register
                                                  .userInfoControllers
                                                  .lastnameController
                                                  .text,
                                              email: register
                                                  .userInfoControllers
                                                  .emailController
                                                  .text,
                                              configpas: register
                                                  .userInfoControllers
                                                  .passwordConfirmationController
                                                  .text,
                                              password: register
                                                  .userInfoControllers
                                                  .passwordController
                                                  .text,
                                              phone: register
                                                  .userInfoControllers
                                                  .phoneController
                                                  .text);
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           User_LogIn()),
                                          // );
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF5669FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(width: 10),
                                Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                // Icon(
                                //   Icons.arrow_circle_right_outlined,
                                //   color: Colors.white,
                                // ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              );
            }));
  }
}

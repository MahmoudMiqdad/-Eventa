
import 'package:eventa_project/view/screen/SignUp/cubit/cubit.dart';
import 'package:eventa_project/view/screen/SignUp/cubit/states.dart';
import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallSignup extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  HallSignup({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var registerhall = RegisterCubit.get(context);
              return Scaffold(
                body: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
                    child: SingleChildScrollView(
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

                          const SizedBox(
                              height: 20), // يمكنك تعديل المسافة حسب الحاجة
                          const Align(
                            alignment:
                                Alignment.centerLeft, // لوضع النص في اليسار
                            child: Text(
                              'Enter your Hall info',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.person,
                              labelText: 'Name',
                              controller:
                                  registerhall.ownerControllers.nameController,
                              errorText: 'Please enter your name',
                              hintText: 'Name',
                              validator:
                                  registerhall.ownerValidators.namesValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.location_on,
                              labelText: 'Address',
                              controller: registerhall
                                  .ownerControllers.addresController,
                              errorText: 'Please enter your Address',
                              hintText: 'Address',
                              validator: registerhall
                                  .ownerValidators.addressValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.description,
                              labelText: 'Description',
                              controller: registerhall
                                  .ownerControllers.descriptionController,
                              errorText: 'Please enter your Description',
                              hintText: 'Description',
                              validator:
                                  registerhall.ownerValidators.description),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.phone,
                              labelText: 'Phone Number',
                              controller: registerhall
                                  .ownerControllers.phonenumberController,
                              errorText: 'Please enter your Phone Number',
                              hintText: 'Phone Number',
                              validator: registerhall
                                  .ownerValidators.phonenumperValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.email,
                              labelText: 'E-mail',
                              controller:
                                  registerhall.ownerControllers.emailController,
                              errorText: 'Please enter your E-mail',
                              hintText: 'E-mail',
                              validator:
                                  registerhall.ownerValidators.emaillValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.key,
                              labelText: 'Password',
                              controller:
                                  registerhall.ownerControllers.passowrd,
                              errorText: 'Please enter your Password',
                              hintText: 'Password',
                              validator: registerhall
                                  .ownerValidators.passworddValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.key,
                              labelText: 'Retype Password',
                              controller: registerhall.ownerControllers
                                  .passwordconfirmationController,
                              errorText: 'Please enter your Confirm Password',
                              hintText: 'Confirm Password',
                              validator: registerhall.ownerValidators
                                  .passwordconfirmationValidator),

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
                                        registerhall.registerhall(
                                            context: context,
                                            name: registerhall.ownerControllers
                                                .nameController.text,
                                            email: registerhall.ownerControllers
                                                .emailController.text,
                                            password: registerhall
                                                .ownerControllers.passowrd.text,
                                            passwordconfirmation: registerhall
                                                .ownerControllers
                                                .passwordconfirmationController
                                                .text,
                                            phonenumber: registerhall
                                                .ownerControllers
                                                .phonenumberController
                                                .text,
                                            address: registerhall
                                                .ownerControllers
                                                .addresController
                                                .text,
                                            description: registerhall
                                                .ownerControllers
                                                .descriptionController
                                                .text);
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
            }));
  }
}


import 'package:eventa_project/view/screen/LogIn/Owner_LogIn.dart';
import 'package:eventa_project/view/screen/SignUp/cubit/cubit.dart';
import 'package:eventa_project/view/screen/SignUp/cubit/states.dart';
import 'package:eventa_project/view/widgets/costom_menuowner.dart';
import 'package:eventa_project/view/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class OwnerSignup extends StatelessWidget{


  OwnerSignup({super.key});
  
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var registerowner = RegisterCubit.get(context);
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
                              height: 20), 
                          const Align(
                            alignment:
                                Alignment.centerLeft, 
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
CustomMenuOwner(controller:registerowner.ownerControllers.categoryidController ,errorText: 'Please enter your category',validator: registerowner.ownerValidators.categoryValidator,),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.person,
                              labelText: 'Name',
                              controller:
                                  registerowner.ownerControllers.nameController,
                              errorText: 'Please enter your name',
                              hintText: 'Name',
                              validator:
                                  registerowner.ownerValidators.namesValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.location_on,
                              labelText: 'Address',
                              controller: registerowner
                                  .ownerControllers.addresController,
                              errorText: 'Please enter your Address',
                              hintText: 'Address',
                              validator: registerowner
                                  .ownerValidators.addressValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.description,
                              labelText: 'Description',
                              controller: registerowner
                                  .ownerControllers.descriptionController,
                              errorText: 'Please enter your Description',
                              hintText: 'Description',
                              validator:
                                  registerowner.ownerValidators.description),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.phone,
                              labelText: 'Phone Number',
                              controller: registerowner
                                  .ownerControllers.phonenumberController,
                              errorText: 'Please enter your Phone Number',
                              hintText: 'Phone Number',
                              validator: registerowner
                                  .ownerValidators.phonenumperValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.email,
                              labelText: 'E-mail',
                              controller:
                                  registerowner.ownerControllers.emailController,
                              errorText: 'Please enter your E-mail',
                              hintText: 'E-mail',
                              validator:
                                  registerowner.ownerValidators.emaillValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.key,
                              labelText: 'Password',
                              controller:
                                  registerowner.ownerControllers.passowrd,
                              errorText: 'Please enter your Password',
                              hintText: 'Password',
                              validator: registerowner
                                  .ownerValidators.passworddValidator),
                          const SizedBox(height: 20),
                          buildTextField(
                              icon: Icons.key,
                              labelText: 'Retype Password',
                              controller: registerowner.ownerControllers
                                  .passwordconfirmationController,
                              errorText: 'Please enter your Confirm Password',
                              hintText: 'Confirm Password',
                              validator: registerowner.ownerValidators
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
                                        registerowner.registerOwner(
                                            context: context,
                                            name: registerowner.ownerControllers
                                                .nameController.text,
                                            email: registerowner.ownerControllers
                                                .emailController.text,
                                            password: registerowner
                                                .ownerControllers.passowrd.text,
                                            passwordconfirmation: registerowner
                                                .ownerControllers
                                                .passwordconfirmationController
                                                .text,
                                            phonenumber: registerowner
                                                .ownerControllers
                                                .phonenumberController
                                                .text,
                                            address: registerowner
                                                .ownerControllers
                                                .addresController
                                                .text,
                                            description: registerowner
                                                .ownerControllers
                                                .descriptionController
                                                .text, categoryid: registerowner.ownerControllers.categoryidController.text);
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

import 'dart:io';


import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddDesing extends StatefulWidget {
  AddDesing({super.key});

  @override
  State<AddDesing> createState() => _AddProductState();
}

class _AddProductState extends State<AddDesing> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  XFile? image;

  

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productCubit(),
      child: BlocConsumer<productCubit, productStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var addproduct = productCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add Product ',
                style: TextStyle(color: Appcolor.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    // Image picker with camera icon
                    GestureDetector(
                      onTap: () async {
                        final pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (pickedFile != null) {
                          setState(() {
                            image = pickedFile;
                          });
                        }
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Appcolor.mainColor),
                          borderRadius: BorderRadius.circular(8),
                          image: image != null
                              ? DecorationImage(
                                  image: FileImage(File(image!.path)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: image == null
                            ? Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Appcolor.mainColor,
                                ),
                              )
                            : null,
                      ),
                    ),

                    const SizedBox(height: 25),
                    TextFormField(
                      controller: addproduct.productControllers.priceController,
                      decoration: const InputDecoration(labelText: ' Price'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a  price' : null,
                    ),

                    const SizedBox(height: 25),
                    TextFormField(
                      controller:
                          addproduct.productControllers.descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a description' : null,
                    ),
                      const SizedBox(height: 25),
                      TextFormField(
                      controller: addproduct.productControllers.availableseatsController,
                      decoration: const InputDecoration(labelText: 'Available Seats'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter the number of available seats' : null,
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          addproduct.addDesign(
                            availableSeats:addproduct.productControllers.availableseatsController.text ,
                            Price: addproduct
                                .productControllers.priceController.text,
                            description: addproduct
                                .productControllers.descriptionController.text,
                            image: image ?? XFile(''),
                            context: context,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Appcolor.mainColor),
                        height: 60,
                        width: double.infinity,
                        child: Center(
                            child: const Text(
                          'Add Desing',
                          style: TextStyle(color: Appcolor.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

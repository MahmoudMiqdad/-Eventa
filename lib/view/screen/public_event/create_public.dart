import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/public_event/cubit/cubit.dart';
import 'package:eventa_project/view/screen/public_event/cubit/states.dart';
import 'package:eventa_project/view/widgets/publicevent/custom_textfield_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreatePublicEvent extends StatefulWidget {
  @override
  _CreatePublicEventState createState() => _CreatePublicEventState();
}

class _CreatePublicEventState extends State<CreatePublicEvent> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  List<Map<String, String>> categories = [
    {'id': '1', 'name': 'حفلة رياضية'},
    {'id': '2', 'name': 'حفلة شعرية'},
    {'id': '3', 'name': 'قومية صحية'},
  ];

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => publiceventCubit(),
      child: BlocConsumer<publiceventCubit, publicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var createpublicevent = publiceventCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Create Event',style: TextStyle(color: Appcolor.white),),
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
                          border: Border.all(color:Appcolor.mainColor),
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
                                  color:Appcolor.mainColor,
                                ),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: createpublicevent.pupliceventControllers.nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a name' : null,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: createpublicevent.pupliceventControllers.ticketpriceController,
                      decoration: const InputDecoration(labelText: 'Ticket Price'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a ticket price' : null,
                    ),
                    const SizedBox(height: 25),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Category'),
                      value: selectedCategory,
                      items: categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category['id'],
                          child: Text(category['name']!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Please select a category' : null,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: createpublicevent.pupliceventControllers.addressController,
                      decoration: const InputDecoration(labelText: 'Address'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter an address' : null,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: createpublicevent.pupliceventControllers.availableseatsController,
                      decoration: const InputDecoration(labelText: 'Available Seats'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter the number of available seats' : null,
                    ),
                    const SizedBox(height: 25),
                    customTextFieldDate(controller: createpublicevent.pupliceventControllers.datecontroler,errorText: 'Please enter a date',formKey: createpublicevent.publiceventValidators.dateValidator),
                 
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: createpublicevent.pupliceventControllers.descriptionController,
                      decoration: const InputDecoration(labelText: 'Description'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a description' : null,
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap:  () {
                          if (_formKey.currentState?.validate() ?? false) {
                            createpublicevent.createpublicevent(
                              name: createpublicevent.pupliceventControllers.nameController.text,
                              ticketPrice: createpublicevent.pupliceventControllers.ticketpriceController.text,
                              categoryId: selectedCategory.toString(),
                              address: createpublicevent.pupliceventControllers.addressController.text,
                              availableSeats: createpublicevent.pupliceventControllers.availableseatsController.text,
                              date: createpublicevent.pupliceventControllers.datecontroler.text,
                              description: createpublicevent.pupliceventControllers.descriptionController.text,
                              image: image ?? XFile(''),
                              context: context,
                            );
                          }
                        },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        color: Appcolor.mainColor),
                        height: 60,
                        width: double.infinity,
                        child: Center(child: const Text('CreatePublicEvent',style: TextStyle(color: Appcolor.white),)),
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

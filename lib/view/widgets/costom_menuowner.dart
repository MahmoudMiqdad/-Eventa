
import 'package:flutter/material.dart';

class CustomMenuOwner extends StatelessWidget {
  const CustomMenuOwner({
    super.key,
    required this.controller, required this.validator, required this.errorText,
  });

  final TextEditingController controller;
 final GlobalKey<FormState> validator;
final String errorText;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
       validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
         key: validator,
      value: null, 
      items: ['Music', 'Art', 'Tech', 'Sports', 'Food']
          .asMap()
          .entries
          .map((entry) {
        int index = entry.key;
        String category = entry.value;
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
          onTap: () {
          
            controller.text = index.toString();
          },
        );
      }).toList(),
      onChanged: (value) {
   
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.category),
        hintText: 'Category',
        labelText: 'Category',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5669ff),
          ),
        ),
      ),
    );
  }
}
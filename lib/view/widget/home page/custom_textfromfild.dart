import 'package:flutter/material.dart';

class Customtextformfieldhome extends StatelessWidget {
  const Customtextformfieldhome({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                          decoration: const InputDecoration(
                            filled: false,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: '| Search',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(181, 147, 142, 142),
                              fontSize: 30,
                            ),
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0,
                            ),
                          ),
                        );
  }
}
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
import 'dart:io';

Widget buildTextField(
    IconData icon, String hintText, String labelText, bool obscureText) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      prefixIcon: Icon(icon),
      hintText: hintText,
      labelText: labelText,
    ),
    obscureText: obscureText,
  );
}

ButtonStyle buildButtonStyle() {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFF5669FF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // حواف منحنية
    ),
    padding:
        EdgeInsets.symmetric(horizontal: 30, vertical: 10), // تقليل حجم الزر
  );
}

Widget buildElevatedButton(String text, IconData icon, VoidCallback onPressed) {
  return ElevatedButton(
    style: buildButtonStyle(),
    onPressed: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20, // حجم الخط أكبر
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10), // تقليل المسافة بين الأيقونة والنص
        Icon(
          icon, // أيقونة السهم
          color: Colors.white,
        ),
      ],
    ),
  );
}

Widget buildElevatedButton2(String text, IconData icon, VoidCallback onPressed,
    {Color color = Colors.blue}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    icon: Icon(icon, color: Colors.white),
    label: Text(text),
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: TextStyle(fontSize: 18),
    ),
  );
}

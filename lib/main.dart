


import 'package:eventa_project/themes.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     
     title: 'Netflix Clone',
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      theme:lightThem,
      home:HomePage()                                 
    );
  }
}

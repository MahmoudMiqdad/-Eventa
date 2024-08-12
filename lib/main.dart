


import 'package:dio/dio.dart';
import 'package:eventa_project/cache/cache_helper.dart';
import 'package:eventa_project/core/api/dio-consumer.dart';
import 'package:eventa_project/cubit/public_event_cubit/cubit.dart';

import 'package:eventa_project/repositories/user/public_event/user_repository.dart';
import 'package:eventa_project/themes.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';

import 'package:eventa_project/view/screen/intro/introScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
     ProviderScope( 
      child: 
       BlocProvider(
      create: (context) =>
          Pupliceventcubit(public_eventRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     
     title: 'EventA',
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      theme:lightThem,
      home:HomePage()                                 
    );
  }
}
  // BlocProvider(
  //         create: (context) => UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
  //       ),
  //       BlocProvider(
  //         create: (context) => SecondCubit(), // مثال لإضافة Cubit ثانية
  //       ),
  //     ],
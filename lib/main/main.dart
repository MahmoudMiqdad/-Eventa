import 'package:eventa_project/main/cubit/cubit.dart';
import 'package:eventa_project/main/cubit/states.dart';
import 'package:eventa_project/shared/cash_helper.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/themes.dart';
import 'package:eventa_project/view/screen/MainOwner/Hall/MainHall.dart';
import 'package:eventa_project/view/screen/MainOwner/MainOwnerScreen.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:eventa_project/view/screen/intro/introScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
late final FlutterLocalization localization;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  localization = FlutterLocalization.instance;
  DioHelper.init();
  await CashHelper.init();
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
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          localization.init(
            mapLocales: [
              const MapLocale('en', AppLocal.en),
              const MapLocale('ar', AppLocal.ar),
            ],
            initLanguageCode: 'en',
          );
          var mainCubitObject = MainCubit.get(context);
          localization.onTranslatedLanguage = mainCubitObject.translateApp();
          return MaterialApp(
            localizationsDelegates: localization.localizationsDelegates,
            supportedLocales: localization.supportedLocales,
            //locale: const Locale("en", "US"),
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            theme: lightThem,
            home: 
            CashHelper.getUserToken() != null ? HomePage() : HomePage() 
          );
        },
      ),
    );
  }
}
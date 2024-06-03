
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/view/screen/home%20page/drawer.dart';
import 'package:eventa_project/view/widget/home%20page/custom_appbar.dart';
import 'package:eventa_project/view/widget/home%20page/custom_categories.dart';

import 'package:eventa_project/view/widget/home%20page/custom_veiw_poster.dart';
import 'package:eventa_project/view/widget/nav_bar/custom_nav_bar.dart';
import 'package:eventa_project/view/widget/nav_bar/custom_nav_bar_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPopup = ref.watch(popupProvider);
    return Scaffold(
      key: scaffoldstate,
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppbar(scaffoldstate: scaffoldstate),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Advertisements                              ",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 10, 10),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(height: 150.0, child: Customveiwposter1()),
            ],
          ),
          Customcategories(),
          const custom_nav_bar(),
          custom_navbar_buttom(showPopup: showPopup),
          if (showPopup)
            custom_nav(),
        ],
      ),
    );
  }
}

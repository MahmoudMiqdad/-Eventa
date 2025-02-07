import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/view/screen/Investmentevents/investment.dart';
import 'package:eventa_project/view/screen/home%20page/drawer.dart';
import 'package:eventa_project/view/widgets/home%20page/custom_appbar.dart';
import 'package:eventa_project/view/widgets/home%20page/custom_categories.dart';

import 'package:eventa_project/view/widgets/home%20page/custom_veiw_poster.dart';
import 'package:eventa_project/view/widgets/nav_bar/custom_nav_bar.dart';
import 'package:eventa_project/view/widgets/nav_bar/custom_nav_bar_buttom.dart';
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
              const SizedBox(height: 150.0, child: Customveiwposter1()),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                      child: Text(
                        'Investment Events',
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 10, 10),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  
             
                ],
              ),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InvestmentEvent()
                                          ),
                                );
                },
                child: Card(
                  elevation: 2,
                  shadowColor: Appcolor.mainColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/test2.webp'))),
                      ),
                     
                    ],
                  ),
                ),
              )
            ],
          ),
          Customcategories(),
          const custom_nav_bar(),
          custom_navbar_buttom(showPopup: showPopup),
          if (showPopup) const custom_nav(),
        ],
      ),
    );
  }
}

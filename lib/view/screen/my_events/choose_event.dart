import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/view/widgets/nav_bar/custom_nav_bar.dart';
import 'package:eventa_project/view/widgets/nav_bar/custom_nav_bar_buttom.dart';
import 'package:eventa_project/view/widgets/publicevent/custom_choose_myevent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ChooseEvent extends ConsumerWidget {
  const ChooseEvent({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final showPopup = ref.watch(popupProvider);
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('Choose My Event',style: TextStyle(color: Appcolor.white),),

      ),
      body:
       Stack(
        children: [
         
          const custom_nav_bar(),
          custom_navbar_buttom(showPopup: showPopup),
          if (showPopup) custom_nav(),
          Custom_choose_event(),
        ],
      ), 
    );
  }
}

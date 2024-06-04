
import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/view/widget/nav_bar/custom_nav_bar.dart';
import 'package:eventa_project/view/widget/nav_bar/custom_nav_bar_buttom.dart';

import 'package:eventa_project/view/widget/publicevent/custom_veiw_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VeiwpublicEvents extends ConsumerWidget {
  VeiwpublicEvents({super.key}) ;
   


  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final showPopup = ref.watch(popupProvider);
    return Scaffold(
      appBar: AppBar(
          elevation: 40,
        backgroundColor: Appcolor.appBar,
              iconTheme:const IconThemeData(color: Appcolor.white),

        title: Text(
          "Events",
          style: TextStyle(fontSize: 31, color: Appcolor.white),
        ),
      ),
      body: Stack(
        children: [
          Customveiwevent(),
         
          const custom_nav_bar(),
          custom_navbar_buttom(showPopup: showPopup),
          if (showPopup)
            custom_nav(),
        ],
      ),
    );
  }
}
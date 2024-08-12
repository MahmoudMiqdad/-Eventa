import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class custom_navbar_buttom extends ConsumerWidget {
  custom_navbar_buttom({
    super.key,
    required this.showPopup,
  });

  final bool showPopup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          ref.read(popupProvider.notifier).state = !showPopup;
       
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: 60,
            height: 60,
            decoration:  BoxDecoration(
             
               boxShadow: [
            BoxShadow(offset: Offset(0, -2),
              color: Appcolor.mainColor,
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
              color: Appcolor.appBar,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

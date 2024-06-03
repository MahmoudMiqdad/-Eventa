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
          padding: const EdgeInsets.symmetric(vertical: 37),
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
               boxShadow: [
            BoxShadow(
              color: Appcolor.mainColor,
              blurRadius: 5,
              spreadRadius: 2,
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

import 'package:eventa_project/color.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';



class ImageAndDiscrebtion extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  final bool isAddress;
  final double latitude;
  final double longitude;
  const ImageAndDiscrebtion(
      {super.key,
      required this.icon,
      required this.text1,
      required this.text2,
      required this.isAddress,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 8,
          decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(3)),
          child: Icon(
            icon,
            size: 30,
            color: Appcolor.mainColor,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        SizedBox(
          width: 35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  text1,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Appcolor.mainColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
             
            ],
          ),
        )
      ],
    );
  }
}

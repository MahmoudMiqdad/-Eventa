import 'package:eventa_project/color.dart';
import 'package:flutter/material.dart';




class CustomAppBarEventDetalis extends StatelessWidget {

  const CustomAppBarEventDetalis(
     );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.arrow_back,
                      size: 21,
                      color: Appcolor.mainColor)),
              const Text(
                'EventDetails',
                style: TextStyle(
                    fontSize: 17,
                    color:  Appcolor.mainColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(width: 100,),
               Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.share, color: Colors.white))),
               const SizedBox()
        ],
      ),
    );
  }
}

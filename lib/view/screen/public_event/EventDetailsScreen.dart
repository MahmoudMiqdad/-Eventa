import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/widgets/publicevent/customAppBar.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RepaintBoundary(
            child: Stack(children: [
      ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/88.jpg'),
                        fit: BoxFit.cover)),
              ),
              const CustomAppBarEventDetalis(),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              const SizedBox(
                height: 3,
              ),
           Row(children: [Container(
            
           )],)
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
      Positioned(
          bottom: 25,
          left: 30,
          right: 30,
          child: Padding(
            padding: const EdgeInsets.only(right: 30,left: 30),
            child: Card(elevation: 8,
              color: Appcolor.mainColor,
              child: Container(
               width: 20,
                child: const Column(
                    children: [
                    
                      Text('Buy ticket',style: TextStyle(color: Appcolor.white,fontSize: 20),),
                      Text('100\$',style: TextStyle(color: Appcolor.white,fontSize: 20))
                    ],
                ),
              ),
            ),
          )),
    ])));
  }
}

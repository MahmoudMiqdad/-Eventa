// screens/halls_screen.dart
import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/hall.dart';
import 'package:eventa_project/view/screen/private/design_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HallsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final halls = ref.watch(hallProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Halls',style: TextStyle(color: Appcolor.white),),

      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: halls.length,
        itemBuilder: (context, index) {
          final hall = halls[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HallDetailsScreen(hall: hall),
                ),
              );
            },
            child: Card(

           elevation: 5,
                    shadowColor: Appcolor.mainColor,
                    margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                 Container(
                  height: 75,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/eventa1.jpg'))),
                 ),
                  Text(hall.name),
                  Text(hall.location),
                  RatingBarIndicator(
                    rating: hall.rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

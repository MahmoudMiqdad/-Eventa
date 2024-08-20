// screens/halls_screen.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';

import 'package:eventa_project/view/screen/owner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/owner/cubit/states.dart';
import 'package:eventa_project/view/screen/owner/design_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HallsScreen extends ConsumerWidget {
  HallsScreen({super.key});
  
  // المتغير لتخزين التصنيف الافتراضي
  final double defaultRating = 3.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return BlocProvider(
        create: (context) => OwnerCubit()..gethall(),
        child: BlocConsumer<OwnerCubit, OwnerStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var halls = OwnerCubit.get(context);
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                    'Halls',
                    style: TextStyle(color: Appcolor.white),
                  ),
                ),
                body: ConditionalBuilder(
                    condition: state is! OwnerInitialState,
                    builder: (context) => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: halls.halls.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HallDetailsScreen(
                                      halls: halls.halls[index].name,
                                   
                                      hallsId: halls.halls[index].id,
                                  
                                      rating: defaultRating,
                                    ),
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
                                      width: double.infinity,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/HALL.png'))),
                                    ),
                                    Text(halls.halls[index].name),
                                    Text(halls.halls[index].description),
                                    RatingBarIndicator(
                                      rating: defaultRating, // عرض التصنيف الافتراضي
                                      itemBuilder: (context, index) =>
                                          const Icon(
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
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}

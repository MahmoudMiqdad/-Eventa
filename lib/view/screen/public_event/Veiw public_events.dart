import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/view/screen/public_event/EventDetailsScreen.dart';
import 'package:eventa_project/view/screen/public_event/cubit/cubit.dart';
import 'package:eventa_project/view/screen/public_event/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VeiwpublicEvents extends StatelessWidget {
  const VeiwpublicEvents({super.key, required this.categorieid});
  final int categorieid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => publiceventCubit()..getpublic(cat: categorieid),
        child: BlocConsumer<publiceventCubit, publicStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var publicevent = publiceventCubit.get(context);

            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Events",
                    style: TextStyle(fontSize: 31, color: Appcolor.white),
                  ),
                ),
                body: ConditionalBuilder(
                    condition: state is! PublicInitialState,
                    builder: (context) => ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EventDetailsPage(
                                        event: publicevent,
                                        id: publicevent
                                                .puplicevent[index].id,
                                         image:image+publicevent
                                                .puplicevent[index].image ,
                                            date: publicevent
                                                .puplicevent[index].date,
                                            description: publicevent
                                                .puplicevent[index].description,
                                            location: publicevent
                                                .puplicevent[index].address,
                                          )),
                                );
                              },
                              child: Card(
                                elevation: 5,
                                shadowColor: Appcolor.mainColor,
                                margin: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                
                                      '${image+publicevent
                                                .puplicevent[index].image}'  ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            publicevent.puplicevent[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Appcolor.mainColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            publicevent.puplicevent[index].date,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            publicevent
                                                .puplicevent[index].address,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  
                                               
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 20,
                          ),
                          itemCount: publicevent.puplicevent.length,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}

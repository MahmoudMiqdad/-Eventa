import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';

import 'package:eventa_project/view/screen/public_event/cubit/cubit.dart';
import 'package:eventa_project/view/screen/public_event/cubit/states.dart';
import 'package:eventa_project/view/screen/public_event/own_event/event_attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Veiw_mypublicEvents extends StatelessWidget {
  Veiw_mypublicEvents({super.key});

  @override
  Widget build(BuildContext context) {
 
    return  BlocProvider(
        create: (context) => publiceventCubit()..getownpublic(),
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
                                  onTap:(){
                                 Navigator.push(context, MaterialPageRoute(builder:(context)=>AttendanceListScreen(event_id: publicevent.puplicevent[index].id,) ));
                                  } ,
                                child: Card(
                                  elevation: 5,
                                  shadowColor: Appcolor.mainColor,
                                  margin: const EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 92,
                                              width: 72,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // image: DecorationImage(
                                                //   image: NetworkImage(
                                                //     //
                                                //     publicevent
                                                //       .puplicevent[index].image),
                                                //   fit: BoxFit.cover,
                                                // ),
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
                                       Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(onPressed: (){
                                                  publicevent.deletpublicevent(eventid: publicevent.puplicevent[index].id.toString(), context: context);
                                                }, icon:const Icon(Icons.delete,color: Colors.red,)),
                                      ),
                                    ],
                                  ),
                                ));
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

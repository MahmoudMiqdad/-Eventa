import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayReservations extends StatefulWidget {
  const DisplayReservations({super.key, });

  @override
  State<DisplayReservations> createState() => _DisplayReservationsState();
}

class _DisplayReservationsState extends State<DisplayReservations> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => productCubit()..displayreservations(),
        child: BlocConsumer<productCubit, productStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var reservations = productCubit.get(context);

            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Display Reservations",
                    style: TextStyle(fontSize: 31, color: Appcolor.white),
                  ),
                ),
                body: ConditionalBuilder(
                    condition: state is! ProductInitialState,
                    builder: (context) => ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 5,
                              shadowColor: Appcolor.mainColor,
                              margin: const EdgeInsets.all(10),
                              child: Column(
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
                              
                                    '${image+reservations.reservations[index].designImage.toString()
                                            }'  ),
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
                                         'date : ${reservations.reservations[index].date}',
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
                                         'Name : ${reservations.reservations[index].firstName}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          
                                             'design_description : ${reservations.reservations[index].designDescription}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                          Text(
                                         'Status : ${reservations.reservations[index].status}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                           const SizedBox(height: 10),
                                 
                                         GestureDetector(
                                          onTap: () {
                                           showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Reserveshop'),
                                    content: const Text(
                                        'Are you sure Approve Reserve '),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
 reservations.approvereserve(context: context, reservationid: reservations.reservations[index].id.toString());    setState(() {
   
 });                                    Navigator.of(context).pop();
                                        },
                                        
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(color: Appcolor.mainColor,borderRadius: BorderRadius.circular(25)),
                                          child: Center(child: Text('Approve Reserve',style: TextStyle(color: Appcolor.white),)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                
                                             
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 20,
                          ),
                          itemCount: reservations.reservations.length,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}

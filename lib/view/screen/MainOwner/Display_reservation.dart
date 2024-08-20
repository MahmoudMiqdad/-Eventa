import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayReservation extends StatefulWidget {
  const DisplayReservation({
    super.key,
  });

  @override
  State<DisplayReservation> createState() => _DisplayReservationState();
}

class _DisplayReservationState extends State<DisplayReservation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => productCubit()..displayreservation(),
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
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              '${image + reservations.reservation[index].designImage.toString()}'),
                                          fit: BoxFit.fill,
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
                                          'date : ${reservations.reservation[index].date}',
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
                                          'hall_phone_number : ${reservations.reservation[index].hallPhoneNumber}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'design_description : ${reservations.reservation[index].designDescription}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'available_seats : ${reservations.reservation[index].availableSeats}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Status : ${reservations.reservation[index].status}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      ' Cancel Reservation'),
                                                  content: const Text(
                                                      'Are you sure Cancel Reservation '),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        reservations.cancelreservation(
                                                            context: context,
                                                            reservationid:
                                                                reservations
                                                                    .reservation[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                        Navigator.of(context)
                                                            .pop();
                                                             setState(() {});
                                                      },
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                           
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Appcolor.mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: Text(
                                              ' Cancel Reservation',
                                              style: TextStyle(
                                                  color: Appcolor.white),
                                            )),
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
                          itemCount: reservations.reservation.length,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}

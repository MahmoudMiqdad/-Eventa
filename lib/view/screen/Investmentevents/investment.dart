import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/Investmentevents/Investmentdetalse.dart';
import 'package:eventa_project/view/screen/Investmentevents/cubit/cubit.dart';
import 'package:eventa_project/view/screen/Investmentevents/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvestmentEvent extends StatelessWidget {
  const InvestmentEvent();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => InvestmentEventCubit()..getInvestment(),
        child: BlocConsumer<InvestmentEventCubit, investmentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var Investment = InvestmentEventCubit.get(context);

            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    "Investment Event",
                    style: TextStyle(fontSize: 31, color: Appcolor.white),
                  ),
                ),
                body: ConditionalBuilder(
                    condition: state is! InvestmentInitialState,
                    builder: (context) => ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Investmentdetals(
                                         
                                              address: Investment
                                                  .investmentEvent[index]
                                                  .address,
                                              reservePrice: Investment
                                                  .investmentEvent[index]
                                                  .reservePrice,
                                              description: Investment
                                                  .investmentEvent[index]
                                                  .description,
                                              endDate: Investment
                                                  .investmentEvent[index]
                                                  .endDate,
                                              start_date: Investment
                                                  .investmentEvent[index]
                                                  .startDate,
                                            )),
                                  );
                                },
                                child: Card(
                                  elevation: 5,
                                  shadowColor: Appcolor.mainColor,
                                  margin: const EdgeInsets.all(10),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 120,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/test2.webp'),
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
                                          Center(
                                            child: Text(
                                              'Address: ${Investment.investmentEvent[index].address}',
                                              style: const TextStyle(
                                                fontSize: 25,
                                                color: Appcolor.mainColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                      Row(children: [
                                        Column(children: [
                                              Text(
                                            'Start Date : ${Investment.investmentEvent[index].startDate}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                               fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'End Date : ${Investment.investmentEvent[index].endDate}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                               fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],),
                                        Spacer(),
                                        GestureDetector(
                                           onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Reserveshop'),
                                    content: const Text(
                                        'Are you sure about the reservation? '),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                        Investment.Reserveshop(context: context,investmenteventid: Investment.investmentEvent[index].id.toString());
                                        Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                                          child: Container(
                                            width: 100,
                                            height: 75,
                                             decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage('assets/images/iinversment.jpg'))
                                          ),),
                                        ),  Spacer(),
                                      ],
                                      )
                                        ],
                                      ),
                                    ),
                                  ]),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 20,
                          ),
                          itemCount: Investment.investmentEvent.length,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}

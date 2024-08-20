import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';
import 'package:eventa_project/view/screen/private/cubit/cubit.dart';
import 'package:eventa_project/view/screen/private/cubit/states.dart';
import 'package:eventa_project/view/screen/private/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DisplayAllorder extends StatefulWidget {
  DisplayAllorder({
    super.key,
  });

  @override
  State<DisplayAllorder> createState() => _MainScreenState();
}

class _MainScreenState extends State<DisplayAllorder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..getorders(),
      child: BlocConsumer<OrderCubit, OrderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var orders = OrderCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('orders'),
            ),
            body: ConditionalBuilder(
              condition: state is! ProductInitialState,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: ListView.builder(
                    itemCount: orders.orders.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Displayorders(
                                      id: orders.orders[index].id.toString(),
                                    )),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          shadowColor: Appcolor.mainColor,
                          margin: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: const CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage('assets/images/logo.png'),
                            ),
                            title: Text(orders.orders[index].price.toString(),
                                style:
                                    const TextStyle(color: Color(0xFF4A43EC))),
                            subtitle: Text(
                                'CreatedAt: ${orders.orders[index].createdAt}'),
                          ),
                        ),
                      );
                    }),
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';
import 'package:eventa_project/view/screen/private/cubit/cubit.dart';
import 'package:eventa_project/view/screen/private/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Displayorders extends StatefulWidget {
  Displayorders({super.key, required this.id,});

final String id;
  @override
  State<Displayorders> createState() => _MainScreenState();
}

class _MainScreenState extends State<Displayorders> {


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => OrderCubit()..getorder(order_id: widget.id.toString()),
      child: BlocConsumer<OrderCubit, OrderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var orderr= OrderCubit.get(context);
          return Scaffold(
           
         appBar: AppBar(title: Text('Order'),),
            body: ConditionalBuilder(
              condition: state is! ProductInitialState,
              builder: (context) =>  Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ListView.builder(
            itemCount: orderr.order.length,
          
            
            itemBuilder: (context, index) {
             
                
              return GestureDetector(
                onTap: () {
                  
                },
                child: Card(
                elevation: 10,
                shadowColor: Appcolor.mainColor,
                margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                        trailing: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                        title: Text(orderr.order[index].description,
                            style: const TextStyle(color: Color(0xFF4A43EC))),
                        subtitle:   Text(' ${orderr.order[index].quantity}'),
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

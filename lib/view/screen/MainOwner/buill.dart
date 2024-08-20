import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillOwner extends StatefulWidget {
  BillOwner({super.key,});


  @override
  State<BillOwner> createState() => _MainScreenState();
}

class _MainScreenState extends State<BillOwner> {


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => productCubit()..getbillownee(),
      child: BlocConsumer<productCubit, productStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var bill = productCubit.get(context);
          return Scaffold(
           
         appBar: AppBar(title: Text('BillOwner',style: TextStyle(color: Appcolor.white),),),
            body: ConditionalBuilder(
              condition: state is! ProductInitialState,
              builder: (context) =>  Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ListView.builder(
            itemCount: bill.bills.length,
          
            
            itemBuilder: (context, index) {
             
                
              return Card(
              elevation: 10,
              shadowColor: Appcolor.mainColor,
              margin: const EdgeInsets.all(5.0),
                child: ListTile(
        trailing: const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        title: Text(bill.bills[index].money,
            style: const TextStyle(color: Color(0xFF4A43EC))),
        subtitle:   Text('CreatedAt: ${bill.bills[index].createdAt}'),
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

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/wallet&payment/cubit/cubit.dart';
import 'package:eventa_project/view/screen/wallet&payment/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsUser extends StatelessWidget {
  const PaymentsUser({super.key});

  @override
  Widget build(BuildContext context) {
   

    return BlocProvider(
        create: (context) => moneyCubit()..getUserpayment(),
        child: BlocConsumer<moneyCubit, moneyStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var payment = moneyCubit.get(context);

            return Scaffold(
                appBar: AppBar(
               
      
        title: const Text(
          'My Payment',
          style: TextStyle(color: Appcolor.white),
        ),
        backgroundColor: Appcolor.mainColor,
      ),
                body: ConditionalBuilder(
                    condition: state is! MoneyInitialState,
                    builder: (context) => ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                      elevation: 5,
                      shadowColor: Appcolor.mainColor,
                      child: ListTile(
                        title: Text('Mony : ${payment.payment[index].money}'),
                        subtitle:Text('payableType : ${payment.payment[index].payableType}'), 
                      ),
                    );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 20,
                          ),
                          itemCount: payment.payment.length,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}
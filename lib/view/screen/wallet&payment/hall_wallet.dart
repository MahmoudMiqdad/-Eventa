import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/wallet&payment/cubit/cubit.dart';
import 'package:eventa_project/view/screen/wallet&payment/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletUserPage extends StatelessWidget {
  const WalletUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
        create: (context) => moneyCubit()..gethallwallet(),
        child: BlocConsumer<moneyCubit, moneyStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var money = moneyCubit.get(context);

            return Scaffold(
                appBar: AppBar(
                iconTheme:const IconThemeData(color: Appcolor.white),

        elevation: 40,
        title: const Text(
          'My Wallet',
          style: TextStyle(color: Appcolor.white),
        ),
        backgroundColor: Appcolor.mainColor,
      ),
                body: ConditionalBuilder(
                    condition: state is! MoneyInitialState,
                    builder: (context) => ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          heightFactor: 3,
          child: Card(
            elevation: 13.0,
            shadowColor: Appcolor.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              height: 200,
              width:double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 236, 67, 67),
                    Color.fromARGB(255, 21, 255, 0)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Visa Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  Text(
                    '\$${money.money.first.money}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 20,
                          ),
                          itemCount: money.money.length,
                        ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}

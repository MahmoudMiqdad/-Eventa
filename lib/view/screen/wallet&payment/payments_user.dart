import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentsUser extends ConsumerWidget {
  const PaymentsUser({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final payments = ref.watch(paymentsProvider);

    return Scaffold(
      appBar: AppBar(
               
      
        title: const Text(
          'My Payment',
          style: TextStyle(color: Appcolor.white),
        ),
        backgroundColor: Appcolor.mainColor,
      ),
      body: Expanded(
        child: ListView.builder(
                  itemCount: payments.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shadowColor: Appcolor.mainColor,
                      child: ListTile(
                        title: Text(payments[index]),
                      ),
                    );
                  },
                ),
      )
    );
  }
}
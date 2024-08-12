import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletUserPage extends ConsumerWidget {
  const WalletUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);
    
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
      body: Padding(
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
                    Appcolor.mainColor,
                    Color.fromARGB(255, 7, 17, 92)
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
                    '\$${balance.toStringAsFixed(2)}',
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
      ),
    );
  }
}

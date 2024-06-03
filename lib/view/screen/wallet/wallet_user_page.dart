import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/controller/wallet.dart';
import 'package:eventa_project/view/widget/nav_bar/custom_nav_bar.dart';
import 'package:eventa_project/view/widget/nav_bar/custom_nav_bar_buttom.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletUserPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);
    final payments = ref.watch(paymentsProvider);
     final showPopup = ref.watch(popupProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text('My Wallet',style: TextStyle(color: Appcolor.white),),
        backgroundColor: Appcolor.mainColor,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Card(
                  elevation: 13.0,
                  shadowColor: Appcolor.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    height: 170,
                    width: 800,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        colors: [Appcolor.mainColor, const Color.fromARGB(255, 7, 17, 92)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Visa Card',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        
                        SizedBox(height: 10),
                        Text(
                          '\$${balance.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'payments',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
               
                Expanded(
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
                ),
              ],
            ),
          ),
        
         
          const custom_nav_bar(),
          custom_navbar_buttom(showPopup: showPopup),
          if (showPopup)
            custom_nav(),
        ],
      ),
    );
  }
}

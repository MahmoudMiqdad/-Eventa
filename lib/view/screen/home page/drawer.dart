import 'package:eventa_project/color.dart';
import 'package:eventa_project/main/cubit/cubit.dart';
import 'package:eventa_project/main/main.dart';
import 'package:eventa_project/shared/cash_helper.dart';
import 'package:eventa_project/shared/componant.dart';
import 'package:eventa_project/view/screen/MainOwner/Display_reservation.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:eventa_project/view/screen/intro/LogIn_option.dart';
import 'package:eventa_project/view/screen/private/displayorder.dart';
import 'package:eventa_project/view/screen/rating%20page/rating_page.dart';
import 'package:eventa_project/view/screen/wallet&payment/payments_user.dart';
import 'package:eventa_project/view/screen/wallet&payment/wallet_user_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'title': 'Home', 'page': HomePage()},
    {'icon': Icons.rate_review, 'title': 'Rating', 'page': RatingPage()},
    {'icon': Icons.account_balance_wallet, 'title': 'Wallet', 'page':WalletUserPage() },
    {'icon': Icons.payment, 'title': 'payments', 'page': PaymentsUser()},
    {'icon': Icons.add_box
    , 'title': 'Orders', 'page': DisplayAllorder()},
        {'icon': Icons.inventory_rounded, 'title': 'Display Reservation', 'page': DisplayReservation()},

  ];

   CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
        Column(children: [
          
          const UserAccountsDrawerHeader(
            
            accountName: Text("MAHMOUD"),
            accountEmail: Text("MAHMOUD@gmile.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png',),
            ),
            decoration: BoxDecoration(
              color:Appcolor.appBar,
            ),
          ),
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon'],color: Appcolor.mainColor,),
              title: Text(item['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']));
                
              },
            );
          }),
           ListTile(
              leading: Icon(Icons.logout,color: Appcolor.mainColor,),
              title: Text('Logout'),
              onTap: () {
                showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Attention'),
                                    content: const Text(
                                        'Are you sure to log out?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                         
              showToast(
                  context: context,
                  text: 'Logout successfully',
                  color: Colors.green);
              navigateAndFinish(context,  LoginPage());
                                      
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                
              },);}),
                

            ],
          ),
        );
      }
    
  }



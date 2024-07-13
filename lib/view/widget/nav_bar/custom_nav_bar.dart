


import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:eventa_project/view/screen/private/hall_list_screen.dart';
import 'package:eventa_project/view/screen/public_event/Veiw%20public_events.dart';
import 'package:eventa_project/view/screen/public_event/create_public.dart';
import 'package:eventa_project/view/screen/ticket/tickets_page.dart';
import 'package:eventa_project/view/screen/wallet/wallet_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class custom_nav_bar extends ConsumerWidget {
   const custom_nav_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIcon = ref.watch(selectedIconProvider);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 252, 252),
          boxShadow: [
            BoxShadow(
              color: Appcolor.mainColor,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.airplane_ticket, color: selectedIcon == 0 ? Appcolor.mainColor: Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  TicketsPage()),
                );
              },
            ),
            //=============================================== wallet
            IconButton(
              icon: Icon(Icons.account_balance_wallet, color: selectedIcon == 1 ?Appcolor.mainColor : Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  WalletUserPage()),
                );
              },
            ),
            const SizedBox(width: 40), 
            IconButton(
              icon: Icon(Icons.home, color: selectedIcon == 2 ? Appcolor.mainColor : Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 2;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.event, color: selectedIcon == 3 ? Appcolor.mainColor : Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 3;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  VeiwpublicEvents()),
                );
              },
              
            ),
          ],
        ),
      ),
    );
  }
}

class custom_nav extends StatelessWidget {
  const custom_nav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: MediaQuery.of(context).size.width / 2 - 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePublicEvent()));
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Appcolor.mainColor,
                    blurRadius: 7,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 27,
                backgroundColor: Appcolor.white,
                foregroundColor: Appcolor.appBar,
                child: Text('public'),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HallsScreen()));
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Appcolor.mainColor,
                    blurRadius: 7,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 27,
                backgroundColor: Appcolor.white,
                foregroundColor: Appcolor.appBar,
                child: Text('private'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

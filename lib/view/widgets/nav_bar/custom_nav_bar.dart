import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:eventa_project/view/screen/my_events/choose_event.dart';
import 'package:eventa_project/view/screen/owner/owner_categories.dart';
import 'package:eventa_project/view/screen/owner/hall_list_screen.dart';
import 'package:eventa_project/view/screen/public_event/create_public.dart';
import 'package:eventa_project/view/screen/public_event/ticket/tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 252, 252, 252),
          boxShadow: [
            BoxShadow(
              color: Appcolor.mainColor,
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.ticket,size: 22
              , color: selectedIcon == 0 ? Appcolor.mainColor: Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  TicketsPage()),
                );
              },
            ),
           
            IconButton(
              icon: FaIcon(FontAwesomeIcons.shop,size: 20
              , color: selectedIcon == 0 ? Appcolor.mainColor: Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  OwnerCategories()),
                );
              },
            ),
            const SizedBox(width: 44), 
            IconButton(
              icon: FaIcon(FontAwesomeIcons.house,size: 22
              , color: selectedIcon == 0 ? Appcolor.mainColor: Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 2;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.calendar,size: 25
              , color: selectedIcon == 0 ? Appcolor.mainColor: Appcolor.grey),
              onPressed: () {
                ref.read(selectedIconProvider.notifier).state = 3;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ChooseEvent()),
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
      bottom: 80,
      left: MediaQuery.of(context).size.width / 2 - 65,
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

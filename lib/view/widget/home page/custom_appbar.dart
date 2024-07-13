
import 'package:eventa_project/color.dart';
import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.scaffoldstate,
  });

  final GlobalKey<ScaffoldState> scaffoldstate;

  @override
  Widget build(BuildContext context) {
    return Container(
      
          
        height: 250,
        width: double.infinity,
        decoration: const BoxDecoration(
          color:Appcolor.appBar,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                     
                      scaffoldstate.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.vertical_distribute_rounded),
                    color: Colors.white,
                    iconSize: 24,
                  ),
                
                  const Expanded(
                    child: Center(
                      child: Text(
                        "EventA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(141, 61, 85, 240),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                        color: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child:Row(
                  children: [
                   
                     Icon(
                              Icons.search,
                              size: 40,
                              color: Colors.white,
                            ),
                             Text('| Search..',style: TextStyle(color:Appcolor.grey,fontSize: 35),),
                  ],
                )
              )
            ],
          ),
        ),
      );
  }
}

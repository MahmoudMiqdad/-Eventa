import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/view/screen/MainOwner/Hall/Display_reservations.dart';
import 'package:eventa_project/view/screen/MainOwner/Hall/Add_desing.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productCubit()..gethlldesign(),
      child: BlocConsumer<productCubit, productStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var designs = productCubit.get(context);
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF5669FF),
                    ),
                    accountName: Text('User Name'),
                    accountEmail: Text('user@example.com'),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png')),
                  ),
                  // ListTile(
                  //   leading: const Icon(Icons.power_settings_new),
                  //   title: const Text('On / Off'),
                  //   trailing: Switch(
                  //     value: _isSwitched,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _isSwitched = value;
                  //       });
                  //     },
                  //   ),
                  // ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text('Reservations'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayReservations()),
                      );
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                title: const Text(
                  'Eventa',
                  style: TextStyle(color: Color.fromARGB(255, 243, 244, 247)),
                )),
            body: ConditionalBuilder(
              condition: state is! ProductInitialState,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Stack(
                  children: [
                    GridView.builder(
                        itemCount: designs.design.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 2,
                                        color: const Color(0xFF5669FF)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(18),
                                              topRight: Radius.circular(18),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(image +
                                                    designs
                                                        .design[index].image),
                                                fit: BoxFit.fill)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 2, top: 7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              //price
                                              'Price : ${designs.design[index].price}',
                                              style: const TextStyle(
                                                  color: Color(0xFF5669FF),
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        //avlepel
                                        'Seats : ${designs.design[index].availableSeats.toString()}',
                                        style: const TextStyle(
                                            color: Color(0xFF5669FF),
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      // ownerItems.description
                                      child: IconButton(
                                          onPressed: () {
                                            showBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    Cuctom_itemowner(
                                                        description: designs
                                                            .design[index]
                                                            .description));
                                          },
                                          icon: const Icon(
                                              Icons.more_vert_outlined,
                                              color: Color(0xFF5669FF)))),
                                )
                              ],
                            ),
                          );
                        }),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: const Color(0xFF5669FF),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddDesing()),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )),
                  ],
                ),
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

class Cuctom_itemowner extends StatelessWidget {
  const Cuctom_itemowner({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 310,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("description",
                style: TextStyle(
                    color: Color(0xFF5669FF),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            )
          ],
        ),
      ),
    );
  }
}

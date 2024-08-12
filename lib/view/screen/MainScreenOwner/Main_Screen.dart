import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key, required this.ownername, required this.description});
  final String ownername;
  final String description;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF5669FF),
              ),
              accountName: Text('User Name'),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('On / Off'),
              trailing: Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Reservations'),
              onTap: () {
                // قم بإضافة الوظيفة هنا
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          // centerTitle: true,
          iconTheme: IconThemeData(
            color:
                Color(0xFF5669FF), // هنا يمكنك تغيير اللون إلى اللون الذي تريده
          ),
          title: Text(
            widget.ownername,
            style: const TextStyle(color: Color(0xFF5669FF)),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Stack(
          children: [
            Expanded(
                child: GridView.builder(
                    itemCount: onwneritem.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      final ownerItems = onwneritem[index];

                      return Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 2, color: Color(0xFF5669FF)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(18),
                                          topRight: Radius.circular(18),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              ownerItems.image,
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 2, top: 7),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ownerItems.price.toString(),
                                          style: TextStyle(
                                              color: Color(0xFF5669FF),
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Color(0xFF5669FF),
                                            child: Icon(
                                              Icons.edit,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 20,
                                            ))
                                      ],
                                    ),
                                  )
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
                                                    ownerItems: ownerItems));
                                      },
                                      icon: const Icon(Icons.more_vert_outlined,
                                          color: Color(0xFF5669FF)))),
                            )
                          ],
                        ),
                      );
                    })),
            Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF5669FF),
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Cuctom_itemowner extends StatelessWidget {
  const Cuctom_itemowner({
    super.key,
    required this.ownerItems,
  });

  final OwnerListitem ownerItems;

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
            SizedBox(
              height: 20,
            ),
            Text(
              ownerItems.description,
              style: TextStyle(
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

class OwnerListitem {
  final int price;
  final String description;
  final String image;

  OwnerListitem(
      {required this.price, required this.description, required this.image});
}

final List<OwnerListitem> onwneritem = [
  OwnerListitem(
      price: 100,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
  OwnerListitem(
      price: 100,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
  OwnerListitem(
      price: 200,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
  OwnerListitem(
      price: 300,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
  OwnerListitem(
      price: 4000,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
  OwnerListitem(
      price: 7800,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
  OwnerListitem(
      price: 7800,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
  OwnerListitem(
      price: 7800,
      description: 'طعام بحري يحتوي عللى سمك فيلية وحساء ',
      image: 'images/eventa1.png'),
];

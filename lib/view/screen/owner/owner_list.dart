import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/owner/owner_item.dart';
import 'package:flutter/material.dart';

class OwnerList extends StatelessWidget {
  OwnerList({super.key, required this.ownertype});
  final String ownertype;
  final List<OwnerList1> owner = [
    OwnerList1(
        address: 'damas',
        phone: 0982504754,
        name: 'mahmouddd',
        description: "محل بيع عصائر",
        image: 'assets/images/23.jpg'),
    OwnerList1(
        address: 'damas',
        phone: 0982504754,
        name: 'ابو عبدو',
        description: "محل بيع عصائر",
        image: 'assets/images/23.jpg'),
    OwnerList1(
        address: 'damas',
        phone: 0982504754,
        name: 'ابو عبدو',
        description: "محل بيع عصائر",
        image: 'assets/images/24.jpg'),
    OwnerList1(
        address: 'damas',
        phone: 0982504754,
        name: 'ابو عبدو',
        description: "محل بيع عصائر",
        image: 'assets/images/25.jpg'),
    OwnerList1(
        address: 'damas',
        phone: 0982504754,
        name: 'ابو عبدو',
        description: "محل بيع عصائر",
        image: 'assets/images/26.png'),
    OwnerList1(
        address: 'damas',
        phone: 0982504754,
        name: 'ابو عبدو',
        description: "محل بيع عصائر",
        image: 'assets/images/28.jpg'),
    OwnerList1(
        address: 'damas',
        phone: 0982504754,
        name: 'ابو عبدو',
        description: "محل بيع عصائر",
        image: 'assets/images/23.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            ownertype,
            style: const TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Center(
          child: Expanded(
            child: ListView.builder(
                itemCount: owner.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OwnerItem(
                                        description: owner[index].description,
                                        ownername: owner[index].name,
                                      )));
                        },
                        child: Container(
                         
                           decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11),)),
                          child: Card(
                            elevation: 5,
                            shadowColor: Appcolor.mainColor,
                            child: Container(
                            padding: const EdgeInsets.all(0.1),
                              width: double.infinity,
                              
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                border:
                                    Border.all(width: 2, color: Appcolor.mainColor),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [Appcolor.black] ),
                                       borderRadius: const BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11),),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          owner[index].image,
                              
                                        ),
                                        fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Align(alignment: Alignment.center,child: Text( owner[index].name,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,))),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(children: [
                                      const Icon(Icons.location_on_outlined,color: Appcolor.icon,),
                                      Text( owner[index].address,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    ],),
                                  ),
                               
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(children: [
                                      const Icon(Icons.phone,color: Appcolor.icon,size: 20,),
                                      Text('${ owner[index].phone}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    ],),
                                  ),
                                  const SizedBox(height: 9,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                }),
          ),
        ),
      ),
    );
  }
}

class OwnerList1 {
  final String name;
  final String description;
  final String image;
  final int phone;
  final String address;

  OwnerList1({
    required this.name,
    required this.description,
    required this.image,
    required this.phone,
    required this.address,
  });
}

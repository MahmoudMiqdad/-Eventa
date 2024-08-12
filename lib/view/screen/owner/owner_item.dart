import 'package:eventa_project/color.dart';
import 'package:flutter/material.dart';

class OwnerItem extends StatelessWidget {
  OwnerItem({super.key, required this.ownername, required this.description});
  final String ownername;
  final String description;
  final List<OwnerListitem> onwneritem = [
    OwnerListitem(
        price: 100,
        description: 'طعام بحري يحتوي عللى سمك فيلية ومحساء ال',
        image: 'assets/images/11.jpg'),
    OwnerListitem(
        price: 100,
        description: 'طعام بحري يحتوي عللى سمك فيلية ومحساء ال',
        image: 'assets/images/22.jpg'),
    OwnerListitem(
        price: 200,
        description: 'طعام بحري يحتوي عللى سمك فيلية ومحساء ال',
        image: 'assets/images/33.jpg'),
    OwnerListitem(
        price: 300,
        description: 'طعام بحري يحتوي عللى سمك فيلية ومحساء ال',
        image: 'assets/images/44.jpg'),
    OwnerListitem(
        price: 4000,
        description: 'طعام بحري يحتوي عللى سمك فيلية ومحساء ال',
        image: 'assets/images/55.jpg'),
    OwnerListitem(
        price: 7800,
        description: 'طعام بحري يحتوي عللى سمك فيلية ومحساء ال',
        image: 'assets/images/66.jpg'),
    OwnerListitem(
        price: 4000,
        description: 'طعام بحري يحتوي عللى سمك فيلية ومحساء ال',
        image: 'assets/images/88.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            ownername,
            style: const TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Stack(
          children: [
            Expanded(
                child: GridView.builder(
                    itemCount: onwneritem.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    width: 2, color: Appcolor.mainColor),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft:  Radius.circular(18),
                                          topRight: Radius.circular(18),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              ownerItems.image,
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10,right: 2,top: 7),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '2000\$',
                                          style: TextStyle(
                                              color: Appcolor.mainColor,
                                              fontSize: 18),
                                        ),
                                        SizedBox(width: 20,),
                                        CircleAvatar(
                                            radius: 15,
                                            backgroundColor:
                                                Appcolor.mainColor,
                                            child: Icon(
                                              Icons.add,
                                              size: 25,
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
                                  child: IconButton(
                                    onPressed:(){
                                         showBottomSheet(
                                context: context,
                                builder: (context) =>
                                    Cuctom_itemowner(ownerItems: ownerItems));
                                    },icon: const Icon(Icons.more_vert_outlined, color: Appcolor.white,)
                                    
                                   
                                  )),
                            )
                          ],
                        ),
                      );
                    })),
            Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Appcolor.mainColor,
                  onPressed: () {},
                  child: const Icon(Icons.arrow_forward),
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
                    color: Appcolor.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          
            
                    
              
          
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

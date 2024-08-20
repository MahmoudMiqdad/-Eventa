import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/model/usermodel/order.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/view/screen/owner/cubit/cubit.dart';
import 'package:eventa_project/view/screen/owner/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class OwnerItem extends StatelessWidget {
   OwnerItem({super.key, required this.ownername, required this.description, required this.ownerid}) {
     
   }
  final String ownername;
  final String description;
final int ownerid;
 String  home ='';
  @override
  Widget build(BuildContext context) {
   
    return BlocProvider(
        create: (context) => OwnerCubit()..getproducts(owner_id: ownerid),
        child: BlocConsumer<OwnerCubit, OwnerStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var products = OwnerCubit.get(context);
            return Scaffold(
                appBar: AppBar(
                           actions: <Widget>[
      IconButton(
                icon: const Text(
                  'IS HOME',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255) ,
                                        fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
               home='home';
                
                },
              )
         
        ],

          centerTitle: true,
          title: Text(
            ownername,
            style: const TextStyle(color: Colors.white),
          )),
                body: ConditionalBuilder(
                    condition: state is! OwnerInitialState,
                    builder: (context) => Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Stack(
          children: [
            GridView.builder(
                itemCount: products.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
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
                                width: 2, color: Appcolor.mainColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120,
                                decoration:BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft:  Radius.circular(18),
                                      topRight: Radius.circular(18),
                                    ),
                                    image: DecorationImage(
                                        image: 
                                          NetworkImage('${image+products.products[index].image}'),
                                        
                                        fit: BoxFit.fill)
                                        ),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(left: 10,right: 2,top: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                     products.products[index].price,
                                      style: const TextStyle(
                                          color: Appcolor.mainColor,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(width: 20,),
                                    GestureDetector(
                                      onTap: () async {
                // await showPurchaseDialog(context);
                // ignore: unused_local_variable
                int? quantity = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // ignore: unused_local_variable
                    int quantity = 1;
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      title: const Text(
                        'How much do you need?',
                        style:
                            TextStyle(color: Color(0xFF164863), fontSize: 23),
                      ),
                      content: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                                child: TextField(
                              onChanged: (value) {
                                quantity = int.tryParse(value) ?? 1;
                              },
                              cursorColor: const Color(0xFF164863),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF164863)),
                                ),
                              ),
                            )),
                          )
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          child: const Text(
                           'OK',
                            style: TextStyle(
                                color: Color(0xFF164863), fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(quantity);
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'colse',
                              style: TextStyle(
                                  color: Color(0xFF164863), fontSize: 20),
                            ))
                      ],
                    );
                  },
                );
                if (quantity != null) {
                  print("//////");
                  product.add(Product(productId:products.products[index].id,quantity:quantity
                    ));
                }
              },
                                      child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor:
                                              Appcolor.mainColor,
                                          child: Icon(
                                            Icons.add,
                                            size: 25,
                                          )),
                                    )
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
                                Cuctomitemowner(ownerItems: products.products[index].description));
                                },icon: const Icon(Icons.more_vert_outlined, color: Appcolor.white,)
                                
                               
                              )),
                        )
                      ],
                    ),
                  );
                }),
       Align(
        alignment: Alignment.bottomCenter,
         child: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Container(
            decoration: BoxDecoration(color: Appcolor.mainColor,borderRadius: BorderRadius.circular(20)),
            height: 50,
            width:200 ,
             child: MaterialButton(onPressed: (){
               showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Attention'),
                                          content: const Text(
                                              'make sure you save your password and email and click OK to go login page '),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                products.addorder(is_home: home, context: context);
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
             },
             child: const Text('Add Order',style: TextStyle(color: Appcolor.white,fontSize: 20),
             ),
             ),
           ),
         ),
       ),
       ]
        ),
      ),
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        ),
                          
                        );
          },
        ));
  }
}

class Cuctomitemowner extends StatelessWidget {
  const Cuctomitemowner({
    super.key,
    required this.ownerItems,
  });

  final String ownerItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
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
            Text(ownerItems
              ,
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

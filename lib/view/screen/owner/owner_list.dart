import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventa_project/color.dart';
import 'package:eventa_project/view/screen/owner/cubit/states.dart';
import 'package:eventa_project/view/screen/owner/owner_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class OwnerList extends StatelessWidget {
  const OwnerList(
      {super.key, required this.ownertype, required this.categoryId});
  final String ownertype;
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OwnerCubit()..getowner(categoryId: categoryId),
        child: BlocConsumer<OwnerCubit, OwnerStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var owners = OwnerCubit.get(context);
            return Scaffold(
                appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      ownertype,
                      style: const TextStyle(color: Colors.white),
                    )),
                body: ConditionalBuilder(
                    condition: state is! OwnerInitialState,
                    builder: (context) => Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child:  Center(
          child: ListView.builder(
              itemCount: owners.owner.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OwnerItem(
                                  ownerid: owners.owner[index].id,
                                      description:owners. owner[index].description,
                                      ownername:owners. owner[index].name,
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
                                    // gradient: LinearGradient(colors: [Appcolor.black] ),
                                     borderRadius: const BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11),),
                                    image: DecorationImage(
                                      image: AssetImage(
                                    'assets/images/logo.png'
                            
                                      ),
                                      fit: BoxFit.fill
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Align(alignment: Alignment.center,child: Text( owners.owner[index].name,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,))),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(children: [
                                    const Icon(Icons.location_on_outlined,color: Appcolor.icon,),
                                    Text(owners. owner[index].address,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  ],),
                                ),
                             
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(children: [
                                    const Icon(Icons.phone,color: Appcolor.icon,size: 20,),
                                    Text('${owners.owner[index].phoneNumber}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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
                    fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        )));
          },
        ));
  }
}

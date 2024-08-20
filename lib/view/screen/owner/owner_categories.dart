import 'package:eventa_project/color.dart';
import 'package:eventa_project/controller/provider_navbar.dart';
import 'package:eventa_project/model/owner_category.dart';
import 'package:eventa_project/shared/imgaeasset.dart';
import 'package:eventa_project/view/screen/owner/owner_list.dart';
import 'package:eventa_project/view/widgets/nav_bar/custom_nav_bar.dart';
import 'package:eventa_project/view/widgets/nav_bar/custom_nav_bar_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OwnerCategories extends ConsumerWidget {
  OwnerCategories({super.key});
  final List<ServiceCategory> categories = [
    ServiceCategory('Restaurants', '${AppImageAsset.Restaurants}',1),
    ServiceCategory('Cars', '${AppImageAsset.cars}',2),
    ServiceCategory('  bands', '${AppImageAsset.bands}',3),
    ServiceCategory(' Flower shops', '${AppImageAsset.flower}',4),
    ServiceCategory(' Security', '${AppImageAsset.security}',5),
    ServiceCategory(' Sound', '${AppImageAsset.sound}',6),
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
        final showPopup = ref.watch(popupProvider);

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
          title: const Text(
        'Owner',
        style: TextStyle(color: Colors.white),
      )),
      body: Stack(
        children: [
          Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.80,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 9,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OwnerList(
                                  categoryId:  categories[index].id,
                                      ownertype: categories[index].name,
                                    )));
                      },
                      child: Card(
                        shadowColor: Appcolor.mainColor,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage( fit: BoxFit.contain,
                                        image:
                                            AssetImage(categories[index].image))),
                              ),
                              Text(
                                categories[index].name,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
           
          const custom_nav_bar(),
          custom_navbar_buttom(showPopup: showPopup),
          if (showPopup) const custom_nav(),
        ],
      ),
    );
  }
}

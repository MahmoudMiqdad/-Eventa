// import 'package:flutter/material.dart';

// class customcard extends StatefulWidget {
//   customcard({super.key, required this.product});
//   ShowProductModel product;
//   @override
//   State<customcard> createState() => _customcardState();
// }

// class ShowProductModel {
// }

// class _customcardState extends State<customcard> {
//   @override
//   bool isLoadingf = false;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.all(8.0),
//         padding: EdgeInsets.all(0.8),
//         decoration: ShapeDecoration(
//           color: Color(0xFFDDF2FD).withOpacity(0.5),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25.0),
//           ),
//         ),
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           SizedBox(
//             width: 220,
//             child: ListTile(
//               title: Text(widget.product.commercialName),
//               textColor: const Color(0xFF164863),
//               subtitle: Text(widget.product.scientificName),
//             ),
//           ),
//           Expanded(
//             child: IconButton(
//               icon: Icon(Icons.favorite),
//               color: Colors.red,
//               onPressed: () async {
//                 isLoading = true;

//                 setState(() {});
//                 try {
//                   await addfavorit();
//                   print('success ');
//                 } catch (e) {
//                   print(e.toString());
//                 }

//                 setState(() {});
//               },
//             ),
//           ),
//           IconButton(
//               icon: Icon(Icons.shopping_cart),
//               color: Color(0xFF164863),
//               onPressed: () async {
//                 // await showPurchaseDialog(context);
//                 // ignore: unused_local_variable
//                 int? quantity = await showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     // ignore: unused_local_variable
//                     int quantity = 1;
//                     return AlertDialog(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                       title: Text(
//                         '10 '.tr,
//                         style:
//                             TextStyle(color: Color(0xFF164863), fontSize: 23),
//                       ),
//                       content: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Expanded(
//                             child: Container(
//                                 child: TextField(
//                               onChanged: (value) {
//                                 quantity = int.tryParse(value) ?? 1;
//                               },
//                               cursorColor: Color(0xFF164863),
//                               decoration: InputDecoration(
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Color(0xFF164863)),
//                                 ),
//                               ),
//                             )),
//                           )
//                         ],
//                       ),
//                       actions: [
//                         ElevatedButton(
//                           child: Text(
//                             '11'.tr,
//                             style: TextStyle(
//                                 color: Color(0xFF164863), fontSize: 20),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop(quantity);
//                           },
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text(
//                               'colse',
//                               style: TextStyle(
//                                   color: Color(0xFF164863), fontSize: 20),
//                             ))
//                       ],
//                     );
//                   },
//                 );
//                 if (quantity != null) {
//                   print("//////");
//                   medisine.add(Medicine(
//                       medicineId: widget.product.id.toString(),
//                       quantity: quantity.toString()));
//                 }
//               }),
//           IconButton(
//             icon: Icon(Icons.arrow_forward_ios),
//             color: Color(0xFF164863),
//             onPressed: () {
//               Get.to(
//                 MedicationDetailScreen(product: widget.product),
//               );
//             },
//           ),
//         ]),
//       ),
//     );
//   }
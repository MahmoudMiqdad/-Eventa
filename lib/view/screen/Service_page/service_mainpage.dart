// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../controller/service.dart';

// class ServiceProviderApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ProviderScope(
//       child: MaterialApp(
//         home: ServiceProviderListScreen(),
//       ),
//     );
//   }
// }
// class ServiceProviderListScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
  

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Service Providers'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (value) {
//             },
//             itemBuilder: (context) => [
//               const PopupMenuItem(
//                 value: null,
//                 child: Text('All'),
//               ),
//               const PopupMenuItem(
//                 value: 'restaurant',
//                 child: Text('Restaurants'),
//               ),
//               const PopupMenuItem(
//                 value: 'decoration',
//                 child: Text('Decoration'),
//               ),
//               const PopupMenuItem(
//                 value: 'car_rental',
//                 child: Text('Car Rentals'),
//               ),
//               const PopupMenuItem(
//                 value: 'entertainment',
//                 child: Text('Entertainment'),
//               ),
//               const PopupMenuItem(
//                 value: 'sound',
//                 child: Text('Sound Systems'),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: serviceProviders.length,
//         itemBuilder: (context, index) {
//           final serviceProvider = serviceProviders[index];
//           return ListTile(
//             leading: Image.asset(serviceProvider.image),
//             title: Text(serviceProvider.name),
//             subtitle: Text(serviceProvider.description),
//           );
//         },
//       ),
//     );
//   }
// }


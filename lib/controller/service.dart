import 'package:eventa_project/data/model/service_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// قائمة مقدمي الخدمات
final serviceProviderListProvider = Provider<List<ServiceProvider>>((ref) {
  return [
    ServiceProvider(
      id: '1',
      name: 'Restaurant A',
      type: 'restaurant',
      description: 'Best food in town',
      image: 'assets/images/logo.png',
      location: 'Location A',
    ),

  ];
});


final serviceProviderFilterProvider = StateProvider<String?>((ref) => null);


final filteredServiceProviderListProvider = Provider<List<ServiceProvider>>((ref) {
  final filter = ref.watch(serviceProviderFilterProvider);
  final list = ref.watch(serviceProviderListProvider);

  if (filter == null) {
    return list;
  } else {
    return list.where((serviceProvider) => serviceProvider.type == filter).toList();
  }
});

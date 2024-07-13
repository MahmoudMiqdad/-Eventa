
import 'package:eventa_project/data/model/hall_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HallController extends StateNotifier<List<Hall>> {
  HallController() : super([
    Hall(
      name: 'صالة  الملكية',
      location: 'دمشق',
      rating: 4.5,
      designs: [
        Design(image: 'assets/images/1.jpg', chairs: 100),
        Design(image: 'assets/images/2.jpg', chairs: 150),
      ],
    ),
    Hall(
      name: 'صالة الأمل',
      location: 'درعا',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),
    Hall(
      name: 'صالة ادم',
      location: 'دمشق',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),
    Hall(
      name: 'صالة الشراتون',
      location: 'دمشق',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),
    Hall(
      name: 'صالة السعادة',
      location: 'حلب ',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),
    Hall(
      name: 'صالة النضال ',
      location: 'دمشق',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),
    Hall(
      name: 'صالة الجود',
      location: 'اللاذقية ',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),

    Hall(
      name: 'صالة الأمل',
      location: 'درعا',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),
    Hall(
      name: 'صالة النجوم',
      location: 'حماة',
      rating: 4.0,
      designs: [
        Design(image: 'assets/images/3.jpg', chairs: 200,),
        Design(image: 'assets/images/4.jpg', chairs: 250),
      ],
    ),
  ]);

  void addHall(Hall hall) {
    state = [...state, hall];
  }

  void addDesignToHall(Hall hall, Design design) {
    state = state.map((h) {
      if (h == hall) {
        return Hall(
          name: h.name,
          location: h.location,
          rating: h.rating,
          designs: [...h.designs, design],
        );
      }
      return h;
    }).toList();
  }

  void updateRating(Hall hall, double rating) {
    state = state.map((h) {
      if (h == hall) {
        return Hall(
          name: h.name,
          location: h.location,
          rating: rating,
          designs: h.designs,
        );
      }
      return h;
    }).toList();
  }
}

final hallProvider = StateNotifierProvider<HallController, List<Hall>>((ref) {
  return HallController();
});

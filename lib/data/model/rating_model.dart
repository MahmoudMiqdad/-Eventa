import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingModel {
  String rating;
  
  RatingModel({required this.rating});
}

final ratingProvider = StateNotifierProvider<RatingNotifier, RatingModel>((ref) {
  return RatingNotifier();
});

class RatingNotifier extends StateNotifier<RatingModel> {
  RatingNotifier() : super(RatingModel(rating: ''));

  void setRating(String newRating) {
    state = RatingModel(rating: newRating);
  }
}

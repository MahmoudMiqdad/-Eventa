
// models/hall.dart
class Hall {
  final String name;
  final String location;
  final double rating;
  final List<Design> designs;

  Hall({required this.name, required this.location, required this.rating, required this.designs});
}

// models/design.dart
class Design {
  final String image;
  final int chairs;
  


  Design({required this.image, required this.chairs});
}

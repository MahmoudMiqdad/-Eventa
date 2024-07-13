class ServiceProvider {
  final String id;
  final String name;
  final String type; // e.g., restaurant, decoration, car rental, etc.
  final String description;
  final String image;
  final String location;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.image,
    required this.location,
  });
}

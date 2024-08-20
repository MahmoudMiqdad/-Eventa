

class Design {
  int id;
  int hallId;
  String description;
  int availableSeats;
  String price;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Design({
    required this.id,
    required this.hallId,
    required this.description,
    required this.availableSeats,
    required this.price,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Design.fromJson(Map<String, dynamic> json) {
    return Design(
      id: json['id'],
      hallId: json['hall_id'],
      description: json['description'],
      availableSeats: json['available_seats'],
      price: json['price'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

 
}

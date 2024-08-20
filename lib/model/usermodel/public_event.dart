

class PublicEvent {
  final int id;
  final String name;
  final String description;
  final String date;
  final String address;
  final String image;
  final String createdAt;
  final String updatedAt;
  final int availableSeats;
  final String ticketPrice;
  final int categoryId;
  final int userId;

  PublicEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.address,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.availableSeats,
    required this.ticketPrice,
    required this.categoryId,
    required this.userId,
  });

  factory PublicEvent.fromJson(Map<String, dynamic> json) {
    return PublicEvent(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      date: json['date'],
      address: json['address'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      availableSeats: json['available_seats'],
      ticketPrice: json['ticket_price'],
      categoryId: json['category_id'],
      userId: json['user_id'],
    );
  }

 
}

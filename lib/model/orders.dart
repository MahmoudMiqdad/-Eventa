class Orders {
  int id;
  int userId;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  Orders({
    required this.id,
    required this.userId,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create an Order instance from JSON
  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      id: json['id'],
      userId: json['user_id'],
      price: json['price'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
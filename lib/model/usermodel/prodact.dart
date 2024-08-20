
class ProductModel {
  int id;
  int ownerId;
  String price;
  String description;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.ownerId,
    required this.price,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      ownerId: json['owner_id'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  
}

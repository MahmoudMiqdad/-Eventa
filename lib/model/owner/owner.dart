class ProductsModel {
  final int id;
  final String description;
  final String price;
  final String image;

  ProductsModel({
    required this.id,
    required this.description,
    required this.price,
    required this.image,
  });


  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }

  // تحويل من كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}

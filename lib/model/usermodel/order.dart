

class Product {
  final int productId;
  final int quantity;

  Product({required this.productId, required this.quantity});

  // Factory method to create an instance of Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      quantity: json['quantity'],
    );
  }}
class Products {
  String description;
  String price;
  int quantity;
  String totalPrice;

  Products({
    required this.description,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  // Factory method to create a Product instance from JSON
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
    );
  }

  
}

class Order {
  int orderId;
  List<Products> products;

  Order({
    required this.orderId,
    required this.products,
  });

  // Factory method to create an Order instance from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Products> productObjects = productList.map((productJson) {
      return Products.fromJson(productJson);
    }).toList();

    return Order(
      orderId: json['order_id'],
      products: productObjects,
    );
  }

  // Method to convert Order instance to JSON
 
}

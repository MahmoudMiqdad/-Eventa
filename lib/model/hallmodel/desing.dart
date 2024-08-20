class DesignModel {
  final int id;
  final String description;
  final String price;
  final int availableSeats;
  final String image;

  DesignModel({
    required this.id,
    required this.description,
    required this.price,
    required this.availableSeats,
    required this.image,
  });


  factory DesignModel.fromJson(Map<String, dynamic> json) {
    return DesignModel(
      id: json['id'],
      description: json['description'],
      price: json['price'],
      availableSeats: json['available_seats'],
      image: json['image'],
    );
  }

}



class OwnerBill {
  int id;
  int orderId;
  int ownerId;
  String money;
  DateTime createdAt;
  DateTime updatedAt;

  OwnerBill({
    required this.id,
    required this.orderId,
    required this.ownerId,
    required this.money,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OwnerBill.fromJson(Map<String, dynamic> json) {
    return OwnerBill(
      id: json['id'],
      orderId: json['order_id'],
      ownerId: json['owner_id'],
      money: json['money'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  
  
}

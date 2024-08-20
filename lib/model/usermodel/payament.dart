

class PaymentData {
  final int id;
  final String money;
  final int userId;
  final String payableType;
  final int payableId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PaymentData({
    required this.id,
    required this.money,
    required this.userId,
    required this.payableType,
    required this.payableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      id: json['id'],
      money: json['money'],
      userId: json['user_id'],
      payableType: json['payable_type'],
      payableId: json['payable_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  
}

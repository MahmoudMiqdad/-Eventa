
class Walletmodel {
  final int id;
  final int userId;
  final String money;
  final DateTime createdAt;
  final DateTime updatedAt;

  Walletmodel({
    required this.id,
    required this.userId,
    required this.money,
    required this.createdAt,
    required this.updatedAt,
  });

  // دالة لتحويل JSON إلى WalletData
  factory Walletmodel.fromJson(Map<String, dynamic> json) {
    return Walletmodel(
      id: json['id'],
      userId: json['user_id'],
      money: json['money'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }


}

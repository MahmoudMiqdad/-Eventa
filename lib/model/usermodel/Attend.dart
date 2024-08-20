
class AttenderModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  AttenderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory AttenderModel.fromJson(Map<String, dynamic> json) {
    return AttenderModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: Pivot.fromJson(json['pivot']),
    );
  }

 
}

class Pivot {
  final int publicEventId;
  final int userId;
  final int ticketsCount;
  final String totalPrice;

  Pivot({
    required this.publicEventId,
    required this.userId,
    required this.ticketsCount,
    required this.totalPrice,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      publicEventId: json['public_event_id'],
      userId: json['user_id'],
      ticketsCount: json['tickets_count'],
      totalPrice: json['total_price'],
    );
  }


}

class HallModel {
  int id;
  String name;
  String description;
  String address;
  int isApproved;
  String email;
  String? emailVerifiedAt;
  String phoneNumber;
  String password;
  String? rememberToken;
  String createdAt;
  String updatedAt;

  HallModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.isApproved,
    required this.email,
    this.emailVerifiedAt,
    required this.phoneNumber,
    required this.password,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HallModel.fromJson(Map<String, dynamic> json) {
    return HallModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      isApproved: json['is_approved'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      phoneNumber: json['phone_number'],
      password: json['password'],
      rememberToken: json['remember_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  
}

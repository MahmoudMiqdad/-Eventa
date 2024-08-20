
class Owner {
  int id;
  String name;
  String address;
  String description;
  String email;
  String? emailVerifiedAt;
  String phoneNumber;
  String password;
  int categoryId;
  String? rememberToken;

  DateTime createdAt;
  DateTime updatedAt;

  Owner({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.email,
    this.emailVerifiedAt,
    required this.phoneNumber,
    required this.password,
    required this.categoryId,
    this.rememberToken,

    required this.createdAt,
    required this.updatedAt,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      phoneNumber: json['phone_number'],
      password: json['password'],
      categoryId: json['category_id'],
      rememberToken: json['remember_token'],
     
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

}


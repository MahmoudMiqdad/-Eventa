class Reservation {
  int? id;
  int? userId;
  int? hallId;
  int? hallDesignId;
  DateTime? date;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
   String? availableseats;
  String? designDescription;
  String? designImage;

  Reservation({
    this.id,
    this.userId,
    this.hallId,
    this.hallDesignId,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.designDescription,
    this.designImage,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      userId: json['user_id'],
      hallId: json['hall_id'],
      hallDesignId: json['hall_design_id'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      designDescription: json['design_description'],
      designImage: json['design_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'hall_id': hallId,
      'hall_design_id': hallDesignId,
      'date': date?.toIso8601String(),
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'design_description': designDescription,
      'design_image': designImage,
    };
  }
}
class ReservationResponse {
  int? status;
  String? message;
  List<Reservation>? data;

  ReservationResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      status: json['Status'],
      message: json['Message'],
      data: (json['Data'] as List<dynamic>?)
          ?.map((item) => Reservation.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'Message': message,
      'Data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class Reservations {
  int? id;
  int? userId;
  int? hallId;
  int? hallDesignId;
  DateTime? date;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? hallPhoneNumber;
  String? designDescription;
  int? availableSeats;
  String? designImage;

  Reservations({
    this.id,
    this.userId,
    this.hallId,
    this.hallDesignId,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.hallPhoneNumber,
    this.designDescription,
    this.availableSeats,
    this.designImage,
  });

  factory Reservations.fromJson(Map<String, dynamic> json) {
    return Reservations(
      id: json['id'],
      userId: json['user_id'],
      hallId: json['hall_id'],
      hallDesignId: json['hall_design_id'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      hallPhoneNumber: json['hall_phone_number'],
      designDescription: json['design_description'],
      availableSeats: json['available_seats'],
      designImage: json['design_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'hall_id': hallId,
      'hall_design_id': hallDesignId,
      'date': date?.toIso8601String(),
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'name': name,
      'hall_phone_number': hallPhoneNumber,
      'design_description': designDescription,
      'available_seats': availableSeats,
      'design_image': designImage,
    };
  }
}


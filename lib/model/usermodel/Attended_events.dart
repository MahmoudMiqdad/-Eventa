// class publicEvents {
//   final int id;
//   final String name;
//   final String description;
//   final String date;
//   final String address;
//   final String image;
//   final String createdAt;
//   final String updatedAt;
//   final int availableSeats;
//   final String ticketPrice;
//   final int categoryId;
//   final int userId;
//   final Pivot pivot;
//   final List<User> users;

//   publicEvents({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.date,
//     required this.address,
//     required this.image,
//     required this.createdAt,
//     required this.updatedAt,
//     // required this.availableSeats,
//     required this.ticketPrice,
//     required this.categoryId,
//     required this.userId,
//     required this.pivot,
//     required this.users,
//   });

//   factory publicEvents.fromJson(Map<String, dynamic> json) {
//     return publicEvents(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       date: json['date'],
//       address: json['address'],
//       image: json['image'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       availableSeats: json['available_seats'],
//       ticketPrice: json['ticket_price'],
//       categoryId: json['category_id'],
//       userId: json['user_id'],
//       pivot: Pivot.fromJson(json['pivot']),
//       users: (json['users'] as List<dynamic>)
//           .map((user) => User.fromJson(user as Map<String, dynamic>))
//           .toList(),
//     );
//   }

 
// }
// class Users {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String phoneNumber;
//   final String email;
//   final String? emailVerifiedAt;
//   final String createdAt;
//   final String updatedAt;
//   final Pivot pivot;

//   Users({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.phoneNumber,
//     required this.email,
//     this.emailVerifiedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.pivot,
//   });

//   factory Users.fromJson(Map<String, dynamic> json) {
//     return Users(
//       id: json['id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       phoneNumber: json['phone_number'],
//       email: json['email'],
//       emailVerifiedAt: json['email_verified_at'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       pivot: Pivot.fromJson(json['pivot']),
//     );
//   }

// }

// class Pivot {
//   final int userId;
//   final int publicEventId;

//   Pivot({
//     required this.userId,
//     required this.publicEventId,
//   });

//   factory Pivot.fromJson(Map<String, dynamic> json) {
//     return Pivot(
//       userId: json['user_id'],
//       publicEventId: json['public_event_id'],
//     );
//   }


// }


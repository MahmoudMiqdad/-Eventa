

class UserModel {
  late int? statues;
  late String message;
  late String token;
  late User user;

  UserModel(this.statues, this.token, this.message);

  UserModel.formJson(Map<String, dynamic> json) {
    print(json);
    statues = json['status'];
    message = json['message'];
    if(statues != 0 && json['data'] != null) user = User.fromJson(json['data']);
  }
}

class User {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String token;
  String? image;

  User(
      {
      required this.name,
      required this.email,
      required this.phone,
      required this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['user']['id'];
    name = json['user']['username'];
    phone = json['user']['mobile'];
    token = json['token'];
  }
}





class UserLoginModel {
  late int? statues;
  late String message;
  late String token;

  UserLoginModel(this.statues, this.token, this.message);

  UserLoginModel.formJson(Map<String, dynamic> json) {
    print(json);
    statues = json['Status'];
    message = json['Message'];
        token = json['Access token'] ;

  }
}


class UserLodinFieldModel {
  late int statues;
    late String message;


  UserLodinFieldModel(this.statues,this.message);

  UserLodinFieldModel.formJson(Map<String, dynamic> json) {
    print(json);
    statues = json['Status'];
        message = json['Message'];

   

  }
}
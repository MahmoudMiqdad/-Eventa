
import 'package:dio/dio.dart';
import 'package:eventa_project/main/main.dart';
import 'package:eventa_project/model/usermodel/order.dart';
import 'package:eventa_project/model/usermodel/public_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';




// Map<String, dynamic> cat = {
//   'skin': 1,
//   'optical': 2,
//   'digestive': 3,
//   'heart': 4,
//   'nero': 5,
//   '1': 'skin',
//   '2': 'optical',
//   '3': 'digestive',
//   '4': 'heart',
//   '5': 'nero'

// };



class OwnerControllers {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passowrd = TextEditingController();
  final TextEditingController passwordconfirmationController =TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController categoryidController = TextEditingController();
  final TextEditingController addresController = TextEditingController();
 
}
class OwnerValidators {
  final GlobalKey<FormState> emaillValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> namesValidator = GlobalKey<FormState>();
final GlobalKey<FormState> categoryValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> passworddValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordconfirmationValidator =
      GlobalKey<FormState>();
  final GlobalKey<FormState> phonenumperValidator = GlobalKey<FormState>();
   final GlobalKey<FormState> description = GlobalKey<FormState>();
    final GlobalKey<FormState> addressValidator = GlobalKey<FormState>();
 
}
class PupliceventControllers {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController datecontroler = TextEditingController();

  final TextEditingController availableseatsController = TextEditingController();
  final TextEditingController ticketpriceController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController categoryidController = TextEditingController();

 
}
class PubliceventValidators {
  final GlobalKey<FormState> nameValidator = GlobalKey<FormState>();
   final GlobalKey<FormState> dateValidator= GlobalKey<FormState>();
  final GlobalKey<FormState> describtionValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> availableseatsValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> addressValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> categoryidConfirmationValidator =
      GlobalKey<FormState>();
  final GlobalKey<FormState> ticketpriceValidator = GlobalKey<FormState>();
 
}




class UserInfoControllers {
  final TextEditingController firstnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =TextEditingController();
  final TextEditingController phoneController = TextEditingController();

}

class UserInfoValidators {
  final GlobalKey<FormState> emailValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> firstnameValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> lastnameValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordValidator = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordConfirmationValidator =
      GlobalKey<FormState>();
  final GlobalKey<FormState> phoneValidator = GlobalKey<FormState>();
 
}
class ProductControllers {
  
  final TextEditingController descriptionController = TextEditingController();


  final TextEditingController availableseatsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

 

 
}

//
mixin AppLocal {
  static const String title = 'title';
  static const String login = 'login';
  static const String register = 'register';
  static const String phone = 'phone';
  static const String password = 'password';
  static const String userName = 'user name';
  static const String reWritePassword = 're-write passowrd';
  static const String optical = 'optical';
  static const String skin = 'skin';
  static const String digestive = 'digestive';
  static const String heart = 'heart';
  static const String nero = 'nero';
  static const String categories = 'categories';
  static const String medicines = 'medicines';
  static const String addCategory = 'Add Category';
  static const Map<String, dynamic> ar = {
    title: 'العنوان',
    login: 'تسجيل الدخول',
    register: 'تسجيل حساب',
    phone: 'رقم الهاتف',
    password: 'كلمة السر',
    userName: 'اسم المستخدم',
    reWritePassword: 'إعادة كلمة السر',
    optical: 'عينية',
    skin: 'جلدية',
    heart: 'قلبية',
    digestive: 'هضمية',
    nero: 'عصبية',
    categories: 'تصنيفات',
    medicines: 'ادوية',
    addCategory: 'إضافة تصنيف'
  };
  static const Map<String, dynamic> en = {
    title: 'title',
    login: 'login',
    register: 'register',
    phone: 'phone',
    password: 'password',
    userName: 'user name',
    reWritePassword: 're-write password',
    heart: 'heart',
    skin: 'skin',
    nero: 'nero',
    digestive: 'digestive',
    optical: 'optical',
    medicines: 'medicines',
    categories: 'categories',
    addCategory: 'Add Category'
  };
}

void translate() {
  if (localization.currentLocale.toString() == 'en') {
    localization.translate('ar');
  } else {
    localization.translate('en');
  }
}

TextDirection currentTextDirection() {
  return localization.currentLocale.toString() == 'en'
      ? TextDirection.ltr
      : TextDirection.rtl;
}


class TranslateButton extends StatelessWidget {
  const TranslateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => translate(), icon: const Icon(Icons.translate));
  }
}
List<Product> product = [];
String image='http://192.168.118.103:8000';

 final ImagePicker _picker = ImagePicker();



// class Search {
//   Future<List<PublicEvent>> searchProducts(
//       {required String commercial_name}) async {
//     Map mapdata = await Api()
//         .get(url: 'http://10.0.2.2:8000/api/search/$commercial_name');
//     List data = mapdata['data'];
//     List<PublicEvent> sarchlist = [];
//     for (int i = 0; i < data.length; i++) {
//       sarchlist.add(
//         PublicEvent.fromJson(data[i]),
//       );
//     }
//     return sarchlist;
//   }
// }
// class Api {


//   Future<dynamic> get({required String url, @required String? token}) async {
//     Map<String, String> headers = {};
//     if (token != null) {
//       headers.addAll({'Authorization': 'Bearer $token'});
//     }
//     print('url=$url,token = $token');
//     http.Response response = await http.get(
//       Uri.parse(url),
//       headers: headers,
//     );
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print(response.body);
//       print(response.statusCode);

//       return jsonDecode(response.body);
//     } else {
//       throw Exception(
//           'there is problem with status code ${response.statusCode}');
//     }
//   }
// }

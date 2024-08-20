
import 'package:dio/dio.dart';
import 'package:eventa_project/shared/cash_helper.dart';

import 'package:image_picker/image_picker.dart';

// ignore: constant_identifier_names
String API_KEY =    (CashHelper.getUserToken()! != " " ? CashHelper.getUserToken()! : " ");


 
//'2|Bo6fsMZwU9CsQBomPtf9szr3liRkLGCPrwmHz5MS0d1b3623';
//192.168.229.83
//192.168.229.83
//'http://192.168.229.83:8000/api/'
class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.118.103:8000/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //==================================================================== REGISTER
  static Future<Response> ownerregister({
    required String name,
    required String email,
    required String password,
    required String passwordconfirmation,
    required String categoryid,
    required String phonenumber,
    required String address,
    required String description,
  }) async {
    print('===================================================== $name');
    return await dio.post(
      'Owner_register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordconfirmation,
        'category_id': categoryid,
        'phone_number': phonenumber,
        'address': address,
        'description': description,
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> hollregster({
    required String name,
    required String email,
    required String password,
    required String passwordconfirmation,
    required String phonenumber,
    required String address,
    required String description,
  }) async {
    print('===================================================== $name');
    return await dio.post(
      'Hall_register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordconfirmation,
        'phone_number': phonenumber,
        'address': address,
        'description': description,
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> registerUser({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String passwordconfirmation,
    required String phone,
  }) async {
    print('===================================================== $firstname');
    return await dio.post(
      'User_register',
      data: {
        'first_name': firstname,
        'last_name': lastname,
        'phone_number': phone,
        'email': email,
        'password': password,
        'password_confirmation': passwordconfirmation,
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> myPost(
      {required dynamic data, required String path}) async {
    return await dio.post('${path}',
        data: data,
        options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

//gitpublic event===========================================================
  static Future<Response> getpublic({required categoryid}) async {
    return await dio.get('Display_public_events/$categoryid',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> getattendpublic(
      {required int event_id, required String token}) async {
    return await dio.get('Display_attenders/$event_id',
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> getownpublic({required String token}) async {
    return await dio.get(
      'Display_own_public_events',
      options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          followRedirects: false,
          validateStatus: (status) {
            return true;
          }),
    );
  }

  static Future<Response> creatpublicevent({
    required String token,
    required String name,
    required String ticketPrice,
    required String categoryId,
    required String address,
    required String availableSeats,
    required String date,
    required String description,
    required XFile image,
  }) async {
    // Create form data
    FormData formData = FormData.fromMap({
      'name': name,
      'ticket_price': ticketPrice,
      'category_id': categoryId,
      'address': address,
      'available_seats': availableSeats,
      'date': date,
      'description': description,
      'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });

    print('Form Data: ${formData.fields}, ${formData.files}');

    // Send the POST request
    return await dio.post(
      'Create_public_event',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: true,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

//============================================================================
  static Future<Response> searchpublic({required String query}) async {
    print('1111111111111111111111111111111111111111111111111');
    return await dio.get('Search/$query',
    
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
            
  }
  //hall================================================

  static Future<Response> gethall() async {
    return await dio.get('Display_halls',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> getDesign({required hallid}) async {
    return await dio.get('Display_designs_for_users/$hallid',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  ///=====================================owner
  static Future<Response> getowner({required categoryid}) async {
    return await dio.get('Display_owners/$categoryid',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> getproducts({required owner_id}) async {
    return await dio.get('Display_products_for_users/$owner_id',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  //========================================= payment
  static Future<Response> getUserpayment({required String token}) async {
    return await dio.get(
      'Display_payment',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getUserwallet({required String token}) async {
    return await dio.get(
      'Display_user_wallet',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
  static Future<Response> getownerwallet({required String token}) async {
    return await dio.get(
      'Display_owner_wallet',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
  static Future<Response> gethallwallet({required String token}) async {
    return await dio.get(
      'Display_hall_wallet',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> logout({required String token}) async {
    return await dio.get('logout',
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> addorder(
      {required mapData, required ishome, required String token}) async {
    print(Response);
    return await dio.post(
      'Add_order/home',
      data: mapData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getdesigen({required String token}) async {
    return await dio.get(
      'Display_designs',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getproduct({required String token}) async {
    return await dio.get(
      'Display_products',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> addproduct({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String passwordconfirmation,
    required String phone,
  }) async {
    print('===================================================== $firstname');
    return await dio.post(
      'User_register',
      data: {
        'first_name': firstname,
        'last_name': lastname,
        'phone_number': phone,
        'email': email,
        'password': password,
        'password_confirmation': passwordconfirmation,
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> adddrsi({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String passwordconfirmation,
    required String phone,
  }) async {
    print('===================================================== $firstname');
    return await dio.post(
      'User_register',
      data: {
        'first_name': firstname,
        'last_name': lastname,
        'phone_number': phone,
        'email': email,
        'password': password,
        'password_confirmation': passwordconfirmation,
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> displayInvestmentevents() async {
    return await dio.get('Display_Investment_events',
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> Reserveshop(
      {required String investmenteventid, required String token}) async {
    print(
        '===================================================== $investmenteventid');
    return await dio.post(
      'Reserve_shop',
      data: {'investment_event_id': investmenteventid},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> Reservehall(
      {required String hallid,
      required String halldesignid,
      required String date,
      required String token}) async {
    print('===================================================== $hallid');
    return await dio.post(
      'Reserve',
      data: {'hall_id': hallid, 'hall_design_id': halldesignid, 'date': date},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> Attendpublicevent(
      {required String ticketscount,
      required String publiceventid,
      required String token}) async {
    print(
        '===================================================== $ticketscount');
    return await dio.post(
      'Attend',
      data: {
        'tickets_count': ticketscount,
        'public_event_id': publiceventid,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> getbillOwner({required String token}) async {
    return await dio.get(
      'Display_bill',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getorallders({required String token}) async {
    return await dio.get(
      'Display_all_orders',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> getorder(
      {required String token, required String order_id}) async {
    return await dio.get(
      'Display_order/$order_id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
    static Future<Response> displayreservation(
      {required String token}) async {
    return await dio.get(
      'Display_reservation',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
   static Future<Response> displayreservations(
      {required String token}) async {
    return await dio.get(
      'Display_reservations',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> deletpublicevent(
      {required eventid, required String token}) async {
    print(Response);
    return await dio.delete(
      'Delete_public_event/$eventid',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> addDesign({
    required String token,
    required String Price,
    required String availableSeats,
    required String description,
    required XFile image,
  }) async {
    // Create form data
    FormData formData = FormData.fromMap({
      'price': Price,
      'available_seats': availableSeats,
      'description': description,
      'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });

    print('Form Data: ${formData.fields}, ${formData.files}');

    // Send the POST request
    return await dio.post(
      'Add_design',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: true,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> addProduct({
    required String token,
    required String Price,
    required String description,
    required XFile image,
  }) async {
    // Create form data
    FormData formData = FormData.fromMap({
      'price': Price,
      'description': description,
      'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });

    print('Form Data: ${formData.fields}, ${formData.files}');

    // Send the POST request
    return await dio.post(
      'Add_product',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: true,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }
  static Future<Response> approvereserve(
      {required String reservation_id, required String token}) async {
    print(
        '===================================================== $reservation_id');
    return await dio.post(
      'Approve_reserve',
      data: {'reservation_id': reservation_id},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }  static Future<Response> cancelreservation(
      {required String reservationid, required String token}) async {
    print(
        '===================================================== $reservationid');
    return await dio.post(
      'Cancel_reservation',
      data: {'reservation_id': reservationid},
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }
}

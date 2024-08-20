// import 'package:eventa_project/model/usermodel/user_model.dart';
// import 'package:eventa_project/shared/componant.dart';
// import 'package:eventa_project/shared/constants.dart';
// import 'package:eventa_project/shared/dio_helper.dart';
// import 'package:eventa_project/view/screen/private/cubit/states.dart';
// import 'package:eventa_project/view/screen/private/displayorder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:eventa_project/model/orders.dart';
import 'package:eventa_project/model/usermodel/order.dart';
import 'package:eventa_project/model/usermodel/ordermodel.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/private/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:json_annotation/json_annotation.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialState());
List<Orders> orders = [];
List<Products> order = [];
  static OrderCubit get(context) => BlocProvider.of(context);

getorders() {
    emit(OrderLoadingState());
    DioHelper.getorallders(token: API_KEY).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['data'].length; i++) {
        orders.add(Orders.fromJson(value.data['data'][i]));
      }
      print('orderssss ${orders.length}');
      emit(OrderSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OrderErrorState());
    });
  }
  getorder({required String order_id}) {
    emit(OrderLoadingState());
    DioHelper.getorder(token: API_KEY,order_id:order_id ).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['data'].length; i++) {
        order.add(Products.fromJson(value.data['data'][i]));
      }
      print('orderssss ${orders.length}');
      emit(OrderSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OrderErrorState());
    });
  }
  
  
}

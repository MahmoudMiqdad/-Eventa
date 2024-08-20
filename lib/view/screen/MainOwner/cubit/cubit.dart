import 'package:eventa_project/model/Reservation.dart';
import 'package:eventa_project/model/hallmodel/desing.dart';
import 'package:eventa_project/model/owner/owner.dart';
import 'package:eventa_project/model/usermodel/billmodel.dart';
import 'package:eventa_project/shared/componant.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/MainOwner/Add_Product.dart';
import 'package:eventa_project/view/screen/MainOwner/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class productCubit extends Cubit<productStates> {
  productCubit() : super(ProductInitialState());

  static productCubit get(context) => BlocProvider.of(context);
  List<DesignModel> design = [];
  List<ProductsModel> product = [];
  List<OwnerBill> bills = [];
    List<Reservation> reservations = [];
        List<Reservations> reservation = [];
    ProductControllers productControllers = ProductControllers();

  gethlldesign() {
    emit(ProductLoadingState());
    DioHelper.getdesigen(token: API_KEY).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        design.add(DesignModel.fromJson(value.data['Data'][i]));
      }
      print('desing: ${design.length}');
      emit(ProductSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }

  getownerproduct() {
    emit(ProductLoadingState());
    DioHelper.getproduct(token: API_KEY).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        product.add(ProductsModel.fromJson(value.data['Data'][i]));
      }
      print('product: ${product.length}');
      emit(ProductSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }

  getbillownee() {
    emit(ProductLoadingState());
    DioHelper.getbillOwner(token: API_KEY).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        bills.add(OwnerBill.fromJson(value.data['Data'][i]));
      }
      print('bills ${product.length}');
      emit(ProductSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }

  addProduct(
      {required String Price,
      required String description,
      required XFile image,
      required context}) {
    emit(ProductLoadingState());
    DioHelper.addProduct(
            token: API_KEY,
            Price: Price,
            description: description,
            image: image)
        .then((value) {
      print(value.data);
      emit(ProductSuccessState());
      if (value.data['Status'] == 200) {
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }
   addDesign(
      {required String Price,
      required String availableSeats,
      required String description,
      required XFile image,
      required context}) {
    emit(ProductLoadingState());
    DioHelper.addDesign(token: API_KEY, Price: Price, availableSeats: availableSeats, description: description, image: image)
        .then((value) {
      print(value.data);
      emit(ProductSuccessState());
      if (value.data['Status'] == 200) {
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }

    displayreservations() {
    emit(ProductLoadingState());
    DioHelper.displayreservations(token: API_KEY).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        reservations.add(Reservation.fromJson(value.data['Data'][i]));
      }
      print('Reservation ${reservations.length}');
      emit(ProductSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }

  displayreservation() {
    emit(ProductLoadingState());
    DioHelper.displayreservation(token: API_KEY).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        reservation.add(Reservations.fromJson(value.data['Data'][i]));
      }
      print('Reservation ${reservations.length}');
      emit(ProductSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }
  approvereserve({ required context,required String reservationid,}) {
    emit(ProductLoadingState());
    DioHelper.approvereserve(reservation_id:reservationid ,token:API_KEY ,).then((value) {
      print(value.data);
      emit(ProductSuccessState());
      if (value.data['Status'] == 200) {
        
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['Message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }
  cancelreservation({ required context,required String reservationid,}) {
    emit(ProductLoadingState());
    DioHelper.cancelreservation(reservationid:reservationid ,token:API_KEY ,).then((value) {
      print(value.data);
      emit(ProductSuccessState());
      if (value.data['Status'] == 200) {
        
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['Message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ProductErrorState());
    });
  }

}


import 'package:eventa_project/model/usermodel/designs.dart';
import 'package:eventa_project/model/usermodel/hollmodel.dart';
import 'package:eventa_project/model/usermodel/owner.dart';
import 'package:eventa_project/model/usermodel/prodact.dart';
import 'package:eventa_project/model/usermodel/user_model.dart';
import 'package:eventa_project/shared/componant.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/owner/cubit/states.dart';
import 'package:eventa_project/view/screen/private/displayorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OwnerCubit extends Cubit<OwnerStates> {
  OwnerCubit() : super(OwnerInitialState());

  static OwnerCubit get(context) => BlocProvider.of(context);
List<HallModel> halls = [];
List<Owner> owner = [];
List<ProductModel> products = [];
List<Design> design = [];

  gethall() {
    emit(OwnerLoadingState());
    DioHelper.gethall().then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        halls.add(HallModel.fromJson(value.data['Data'][i]));
      }
      print('Hall ${halls.length}');
      emit(OwnerSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OwnerErrorState());
    });

    
  }
  
  getowner({required categoryId}) {
    emit(OwnerLoadingState());
    DioHelper.getowner (categoryid: categoryId).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        owner.add(Owner.fromJson(value.data['Data'][i]));
      }
      print('owner length: ${owner.length}');
      emit(OwnerSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OwnerErrorState());
    });

    
  }
   getproducts({required owner_id}) {
    emit(OwnerLoadingState());
    DioHelper.getproducts (owner_id: owner_id).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        products.add(ProductModel.fromJson(value.data['Data'][i]));
      }
      print('product length: ${products.length}');
      emit(OwnerSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OwnerErrorState());
    });

    
  }
     getDesign({required hallid}) {
    emit(OwnerLoadingState());
    DioHelper.getDesign (hallid: hallid).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        design.add(Design.fromJson(value.data['Data'][i]));
      }
      print('Design length: ${design.length}');
      emit(OwnerSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OwnerErrorState());
    });

    
  }
 
addorder({required String is_home, required context}) {
  Map<String, dynamic> mapData = {};
  mapData['products'] = []; 
print('map');
  for (var i = 0; i < product.length; i++) {
    mapData['products'].add({
      "product_id": product[i].productId.toString(),
      "quantity": product[i].quantity.toString()
    });
  }

  emit(OwnerLoadingState());

  DioHelper.addorder(mapData: mapData, ishome: is_home, token: API_KEY).then((value) {
    print(value.data);

    if (value.data['Status'] == 200) {
      showToast(
        context: context,
        text: value.data['Message'],
        color: Colors.green
      );
      UserLodinFieldModel orderFieldModel = UserLodinFieldModel.formJson(value.data);
       navigateAndFinish(context, DisplayAllorder());
    } else {
      print("The message is" + value.data['Message']);
      showToast(
        context: context, 
        text: value.data['Message'], 
        color: Colors.red
      );
    }

    emit(OwnerSuccessState());
  }).onError((error, stackTrace) {
    print(error.toString());
    emit(OwnerErrorState());
  });
}



   Reservehall({ required context,required String halldesignid,required String hallid,required String date}) {
    emit(OwnerLoadingState());
    DioHelper.Reservehall(date: date,halldesignid:halldesignid ,hallid:hallid , token: API_KEY).then((value) {
      print(value.data);
      emit(OwnerSuccessState());
      if (value.data['Status'] == 200) {
        
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['Message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(OwnerErrorState());
    });
  }
}

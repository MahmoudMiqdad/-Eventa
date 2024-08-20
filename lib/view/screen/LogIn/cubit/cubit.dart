import 'package:eventa_project/model/usermodel/user_model.dart';
import 'package:eventa_project/shared/cash_helper.dart';
import 'package:eventa_project/shared/componant.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/LogIn/cubit/states.dart';
import 'package:eventa_project/view/screen/home%20page/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitialState());
  static LogInCubit get(context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginValidator = GlobalKey<FormState>();

  // UserLodinFieldModel? userLodinFieldModel;

  login({required String email, required String password, required context}) {
    emit(LogInLoadingState());

    DioHelper.myPost(
            data: {"email": email, "password": password}, path: "User_login")
        .then((value) {
      print(value.data);
       
        if (value.data['Status'] == 200) {
         showToast(
              context: context,
              text: value.data['Message'],
              color: Colors.green);
              UserLoginModel userLodinFieldModel = UserLoginModel.formJson(value.data);
                CashHelper.putUserToken(userToken: userLodinFieldModel.token);
          navigateAndFinish(context, HomePage());
        } else {
                         UserLoginModel userLodinFieldModel = UserLoginModel.formJson(value.data);;
          print("The message is" + value.data['Message']);
          showToast(
              context: context, text: value.data['Message'], color: Colors.red);
        }
        emit(LogInSuccessState());
    }).onError((error, stackTrace) {
      print('log in error: ${error.toString()}');
      emit(LogInErrorState());
    });
  }
  //===hall==================================================hall
    loginhall({required String email, required String password, required context}) {
    emit(LogInLoadingState());

    DioHelper.myPost(
            data: {"email": email, "password": password}, path: "User_login")
        .then((value) {
      print(value.data);
      UserLoginModel userLodinFieldModel = UserLoginModel.formJson(value.data);
        if (value.data['Status'] != 200) {
          print("The message is" + value.data['Message']);
          showToast(
              context: context, text: value.data['Message'], color: Colors.red);
        } else {
          showToast(
              context: context,
              text: value.data['Message'],
              color: Colors.green);
          navigateAndFinish(context, HomePage());
        }
        emit(LogInSuccessState());
    }).onError((error, stackTrace) {
      print('log in error: ${error.toString()}');
      emit(LogInErrorState());
    });
  }
   loginOwner({required String email, required String password, required context}) {
    emit(LogInLoadingState());

    DioHelper.myPost(
            data: {"email": email, "password": password}, path: "Owner_login")
        .then((value) {
      print(value.data);

      if (value.data["Status"] == 200) {
 UserLoginModel       userLodinModel = UserLoginModel.formJson(value.data);
        CashHelper.putUserToken(userToken: userLodinModel!.token);
        print(userLodinModel);
        showToast(
            context: context, text: value.data['message'], color: Colors.green);
        navigateAndFinish(context, HomePage());

        emit(LogInSuccessState());
      }
  // ignore: unused_local_variable
  UserLoginModel    userLodinFieldModel = UserLoginModel.formJson(value.data);
//CashHelper.putUserToken(userToken:"");
      showToast(
          context: context, text: value.data['message'], color: Colors.red);
      print(CashHelper.getUserToken());
      emit(LogInError404State());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(LogInErrorState());
    });
  }
}

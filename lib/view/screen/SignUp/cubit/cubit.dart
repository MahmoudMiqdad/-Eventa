

import 'package:eventa_project/model/hallmodel/regester.dart';
import 'package:eventa_project/model/usermodel/user_model.dart';
import 'package:eventa_project/shared/componant.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/LogIn/User_LogIn.dart';
import 'package:eventa_project/view/screen/SignUp/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  UserInfoControllers userInfoControllers = UserInfoControllers();
  UserInfoValidators userInfoValidators = UserInfoValidators();
  OwnerControllers ownerControllers=OwnerControllers();
 OwnerValidators ownerValidators=OwnerValidators();
  ///If the image is null, then it's the first time to be selected
  String? image;

  var questions = [false, false, false, false];

  bool passwordIsShown = true;
  void registerUser({
    required context,
    required String name,
    required String lastname,
    required String email,
    required String configpas,
    required String password,
    required String phone,
  }) {
    if (requiredInformationFilled(context: context)) {
      emit(RegisterLoadingState());
      print('------------------------------------- in register');
      DioHelper.registerUser(
              firstname: name,
              lastname: lastname,
              email: email,
              password: password,
              passwordconfirmation: configpas,
              phone: phone)
          .then((value) {
        // print(value.data);
        print(
            '------------------------------------------------------------ $name');
        UserModel registerModel = UserModel.formJson(value.data);
        if (value.data['status'] != 200) {
          print("The message is" + value.data['message']);
          showToast(
              context: context, text: value.data['message'], color: Colors.red);
        } else {
          showToast(
              context: context,
              text: value.data['message'],
              color: Colors.green);
          navigateAndFinish(context, User_LogIn());
        }
        emit(RegisterSuccessState());
      }).catchError((error) {
        print('register error: ${error.toString()}');
        emit(RegisterErrorState());
      });
    }
  }

 

  void registerOwner({
    required context,
    required String name,
    required String email,
    required String password,
    required String passwordconfirmation,
    required String categoryid,
    required String phonenumber,
    required String address,
    required String description,

  }) {
    if (requiredInformationFilled(context: context)) {
      emit(RegisterLoadingState());
      print('------------------------------------- in register');
      DioHelper.ownerregister(
              name: name,
              email: email,
              password: password,
              passwordconfirmation: passwordconfirmation,
              categoryid: categoryid,
              phonenumber: phonenumber,
              address: address,
              description: description,
              )
          .then((value) {
        // print(value.data);
        print(
            '------------------------------------------------------------ $name');
        UserModel registerModel = UserModel.formJson(value.data);
        if (value.data['status'] != 200) {
          print("The message is" + value.data['message']);
          showToast(
              context: context, text: value.data['message'], color: Colors.red);
        } else {
          showToast(
              context: context,
              text: value.data['message'],
              color: Colors.green);
          navigateAndFinish(context, User_LogIn());
        }
        emit(RegisterSuccessState());
      }).catchError((error) {
        print('register error: ${error.toString()}');
        emit(RegisterErrorState());
      }
      );
    }
 
    
  }

   void registerhall({
    required context,
    required String name,
    required String email,
    required String password,
    required String passwordconfirmation,

    required String phonenumber,
    required String address,
    required String description,

  }) {
    if (requiredInformationFilled(context: context)) {
      emit(RegisterLoadingState());
      print('------------------------------------- in register');
      DioHelper.hollregster(
              name: name,
              email: email,
              password: password,
              passwordconfirmation: passwordconfirmation,
              phonenumber: phonenumber,
              address: address,
              description: description,
              )
          .then((value) {
        // print(value.data);
        print(
            '------------------------------------------------------------ $name');
        hall registerModel = hall.fromJson(value.data) ;
        if (value.data['Status'] != 200) {
          print("The message is" + value.data['Message']);
          showToast(
              context: context, text: value.data['Message'], color: Colors.red);
        } else {
          showToast(
              context: context,
              text: value.data['Message'],
              color: Colors.green);
          navigateAndFinish(context, User_LogIn());
        }
        emit(RegisterSuccessState());
      }).catchError((error) {
        print('register error: ${error.toString()}');
        emit(RegisterErrorState());
      }
      );
    }
  }




  

  requiredInformationFilled({required BuildContext context}) {
    return true;
    // // تحقق من صحة الحقول باستخدام Safe Check (التأكد من عدم كون القيم null)
    // final isFirstnameValid = userInfoValidators.firstnameValidator.currentState!.validate();
    // final isLastnameValid = userInfoValidators.lastnameValidator.currentState!.validate();
    // final isEmailValid = userInfoValidators.emailValidator.currentState!.validate();
    // final isPhoneValid = userInfoValidators.phoneValidator.currentState!.validate();
    // final isPasswordConfirmationValid = userInfoValidators.passwordConfirmationValidator.currentState!.validate();
    // //return true;
    // // تحقق من تطابق كلمات المرور
    // if (userInfoControllers.passwordController.text !=
    //     userInfoControllers.passwordConfirmationController.text) {
    //   showToast(
    //       context: context, text: 'Passwords don\'t match', color: Colors.red);
    //   return false;
    // }

    // // تحقق من صحة جميع الحقول
    // final requiredInformationFilled = isFirstnameValid &&
    //     isLastnameValid &&
    //     isEmailValid &&
    //     isPhoneValid &&
    //     isPasswordConfirmationValid;

    // if (!requiredInformationFilled) {
    //   showToast(
    //       context: context,
    //       text: 'Please enter required information',
    //       color: Colors.red,
    //       duration: 4);
    //   return false;
    // }

    // return true;
  }
}


// // class AddDietsController extends GetxController {
// //   var description = ''.obs;
// //   var time = ''.obs;
// //   var dayId = 0;
// //   Uint8List? fileBytes; // Nullable to handle cases where no file is picked
// //   var isLoading = false.obs;
// //   var imagePath = ''.obs; // Updated to observable

// //   Future<void> pickImage() async {
// //     try {
// //       final result = await FilePicker.platform.pickFiles(type: FileType.any);
// //       if (result != null && result.files.isNotEmpty) {
// //         fileBytes = result.files.first.bytes;
// //         final fileName = result.files.first.name;
// //         imagePath.value = fileName; // Set the image path to be used
// //         print('File selected: $fileName');
// //       } else {
// //         print("No file selected or file is empty");
// //       }
// //     } catch (e) {
// //       print("Error picking file: $e");
// //     }
// //   }

// //   Future<void> addDiet() async {
// //     if (description.value.isNotEmpty && time.value.isNotEmpty && fileBytes != null) {
// //       isLoading.value = true;
// //       print('In addDiet');
// //       DeitsModel deitsModel = DeitsModel(
// //         time: time.value,
// //         day_id: dayId,
// //         description: description.value,
// //         image: fileBytes!, // Ensure fileBytes is not null
// //       );
// //       print('In addDiet2');

// //       // Assume this function sends the model to a server and returns success/failure
// //       bool success = await submitDietToServer(deitsModel); 

// //       isLoading.value = false;
// //       if (success) {
// //         Get.snackbar('Success', 'Diet added successfully');
// //         description.value = '';
// //         time.value = '';
// //         imagePath.value = '';
// //         fileBytes = null;
// //       } else {
// //         Get.snackbar('Error', 'Failed to add diet');
// //       }
// //     } else {
// //       Get.snackbar('Error', 'Please fill all fields and select an image');
// //     }
// //   }

// //   // Simulating a server submission, replace with actual implementation
// //   Future<bool> submitDietToServer(DeitsModel deitsModel) async {
// //     // Add your actual server logic here.
// //     await Future.delayed(Duration(seconds: 2)); // Simulating network delay
// //     return true; // Simulate a successful response
// //   }
// // }

// // class DeitsModel {
// //   final String time;
// //   final int day_id;
// //   final String description;
// //   final Uint8List image;
// //   final int? id;

// //   DeitsModel(
// //       {required this.time,
// //       required this.day_id,
// //       required this.description,
// //       required this.image,
// //       this.id});

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'time': time,
// //       'day_id': day_id,
// //       'description': description,
// //       'image': image,
// //       'id': id
// //     };
// //   }

// //   factory DeitsModel.fromJson(Map<String, dynamic> json) {
// //     return DeitsModel(
// //         time: json['time'],
// //         day_id: json['day_id'],
// //         description: json['description'],
// //         image: json['image'],
// //         id: json['id']);
// //   }
// }

import 'package:eventa_project/model/usermodel/Attend.dart';
import 'package:eventa_project/model/usermodel/public_event.dart';
import 'package:eventa_project/shared/componant.dart';
import 'package:eventa_project/shared/constants.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/public_event/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
// ignore: camel_case_types
class publiceventCubit extends Cubit<publicStates> {
  publiceventCubit() : super(PublicInitialState());

  static publiceventCubit get(context) => BlocProvider.of(context);
List<PublicEvent> puplicevent = [];


List<AttenderModel> attendevent = [];
 PupliceventControllers pupliceventControllers = PupliceventControllers();
  PubliceventValidators publiceventValidators = PubliceventValidators();


  getpublic({required cat}) {
    emit(PublicLoadingState());
    DioHelper.getpublic(categoryid: cat).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (int i = 0; i < value.data['data'].length; i++) {
        puplicevent.add(PublicEvent.fromJson(value.data['data'][i]));
      }
      print('public length: ${puplicevent.length}');
      emit(PublicSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(PublicErrorState());
    });

    
  }
   search({required query}) {
    emit(PublicLoadingState());
          print('000000000000000000000000000000000000000000000000');
    DioHelper.searchpublic(query: query).then((value) {
      // ignore: avoid_print
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        puplicevent.add(PublicEvent.fromJson(value.data['Data'][i]));
      }
      print('public length: ${puplicevent.length}');
      emit(PublicSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(PublicErrorState());
    });

    
  }
      //=========================================
  getownpublic() {
    emit(PublicLoadingState());
    DioHelper.getownpublic(token: API_KEY).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['data'].length; i++) {
        puplicevent.add(PublicEvent.fromJson(value.data['data'][i]));
      }
      print('public own length: ${puplicevent.length}');
      emit(PublicSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(PublicErrorState());
    });
  }
   getattendpublic({required event_id}) {
    emit(PublicLoadingState());
    DioHelper.getattendpublic(event_id:event_id, token: API_KEY!).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        attendevent.add(AttenderModel.fromJson(value.data['Data'][i]));
      }
      print('public Attend length: ${attendevent.length}');
      emit(PublicSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(PublicErrorState());
    });
  }

  // attendedevents() {
  //   emit(PublicLoadingState());
  //   DioHelper.attendedevents(token: API_KEY).then((value) {
  //     // ignore: avoid_print
  //     print(value.data);
  //     for (int i = 0; i < value.data['data'].length; i++) {
  //       Attend.add(Pivot.fromJson(value.data['data'][i]));
  //     }
  //     print('public length: ${puplicevent.length}');
  //     emit(PublicSuccessState());
  //   }).onError((error, stackTrace) {
  //     print(error.toString());
  //     emit(PublicErrorState());
  //   });

    
  // }
//  void attendedevents() {
//   emit(PublicLoadingState());
//   DioHelper.attendedevents(token: API_KEY).then((value) {
//     // ignore: avoid_print
//     print(value.data);
//     // تحويل البيانات إلى قائمة من PublicEvent
//     List<publicEvents> events = (value.data['data'] as List)
//         .map((eventJson) => publicEvents.fromJson(eventJson))
//         .toList();

//     // تخزين البيانات
//     // publicEvents.addAll(events);
//     // print('public length: ${publicEvents..length}');
//     emit(PublicSuccessState());
//   }).onError((error, stackTrace) {
//     print(error.toString());
//     emit(PublicErrorState());
//   });
// }

  // requiredInformationFilled({required BuildContext context}) {
  //   return true;
  //   // // تحقق من صحة الحقول باستخدام Safe Check (التأكد من عدم كون القيم null)
  //   // final isFirstnameValid = userInfoValidators.firstnameValidator.currentState!.validate();
  //   // final isLastnameValid = userInfoValidators.lastnameValidator.currentState!.validate();
  //   // final isEmailValid = userInfoValidators.emailValidator.currentState!.validate();
  //   // final isPhoneValid = userInfoValidators.phoneValidator.currentState!.validate();
  //   // final isPasswordConfirmationValid = userInfoValidators.passwordConfirmationValidator.currentState!.validate();
  //   // //return true;
  //   // // تحقق من تطابق كلمات المرور
  //   // if (userInfoControllers.passwordController.text !=
  //   //     userInfoControllers.passwordConfirmationController.text) {
  //   //   showToast(
  //   //       context: context, text: 'Passwords don\'t match', color: Colors.red);
  //   //   return false;
  //   // }

  //   // // تحقق من صحة جميع الحقول
  //   // final requiredInformationFilled = isFirstnameValid &&
  //   //     isLastnameValid &&
  //   //     isEmailValid &&
  //   //     isPhoneValid &&
  //   //     isPasswordConfirmationValid;

  //   // if (!requiredInformationFilled) {
  //   //   showToast(
  //   //       context: context,
  //   //       text: 'Please enter required information',
  //   //       color: Colors.red,
  //   //       duration: 4);
  //   //   return false;
  //   // }

  //   // return true;
  // }
  
   attendpublicevent({ required context,required String ticketscount,required String publiceventid}) {
    emit(PublicLoadingState());
    DioHelper.Attendpublicevent(ticketscount: ticketscount, publiceventid: publiceventid, token: API_KEY).then((value) {
      print(value.data);
      emit(PublicSuccessState());
      if (value.data['Status'] == 200) {
        
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['Message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(PublicErrorState());
    });
  }
     createpublicevent({  
     required String name,
    required String ticketPrice,
    required String categoryId,
    required String address,
    required String availableSeats,
    required String date,
    required String description,
    required XFile image,
    required context}) {
    emit(PublicLoadingState());
    DioHelper.creatpublicevent(token: API_KEY, name: name, ticketPrice: ticketPrice, categoryId: categoryId, address: address, availableSeats: availableSeats, date: date, description: description, image: image,).then((value) {
      print(value.data);
      emit(PublicSuccessState());
      if (value.data['Status'] == 200) {
        
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(PublicErrorState());
    });
  }
  deletpublicevent({  
     required String eventid,
    required context}) {
    emit(PublicLoadingState());
    DioHelper.deletpublicevent(eventid: eventid, token: API_KEY).then((value) {
      print(value.data);
      emit(PublicSuccessState());
      if (value.data['Status'] == 200) {
        
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(PublicErrorState());
    });
  }

}

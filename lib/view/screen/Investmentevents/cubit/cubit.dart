
import 'package:eventa_project/model/usermodel/Investment.dart';

import 'package:eventa_project/shared/componant.dart';

import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/Investmentevents/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InvestmentEventCubit extends Cubit<investmentStates> {
  InvestmentEventCubit() : super(InvestmentInitialState());

  static InvestmentEventCubit get(context) => BlocProvider.of(context);
List<InvestmentEventmodel> investmentEvent = [];


  getInvestment() {
    emit(InvestmentLoadingState());
    DioHelper.displayInvestmentevents().then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        investmentEvent.add(InvestmentEventmodel.fromJson(value.data['Data'][i]));
      }
      print('investment ${investmentEvent.length}');
      emit(InvestmentSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(InvestmentErrorState());
    });

    
  }
  
 
   Reserveshop({ required context,required String investmenteventid,}) {
    emit(InvestmentLoadingState());
    DioHelper.Reserveshop(investmenteventid:investmenteventid ,token:API_KEY ,).then((value) {
      print(value.data);
      emit(InvestmentSuccessState());
      if (value.data['Status'] == 200) {
        
        showToast(
            context: context, text: value.data['Message'], color: Colors.green);
      } else {
        showToast(
            context: context, text: value.data['Message'], color: Colors.red);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(InvestmentErrorState());
    });
  }
}

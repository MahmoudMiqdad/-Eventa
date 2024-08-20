
import 'package:eventa_project/model/usermodel/payament.dart';
import 'package:eventa_project/model/usermodel/wallet.dart';
import 'package:eventa_project/shared/dio_helper.dart';
import 'package:eventa_project/view/screen/wallet&payment/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class moneyCubit extends Cubit<moneyStates> {
  moneyCubit() : super(MoneyInitialState());

  static moneyCubit get(context) => BlocProvider.of(context);
List<PaymentData> payment = [];
List<Walletmodel> money = [];
List<Walletmodel> moneyowner = [];
List<Walletmodel> moneyhall = [];

  getUserpayment() {
    emit(MoneyLoadingState());
    DioHelper.getUserpayment(token:API_KEY ).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        payment.add(PaymentData.fromJson(value.data['Data'][i]));
      }
      print('payment length: ${payment.length}');
      emit(MoneySuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(MoneyErrorState());
    });
  }
    getUserwallet() {
    emit(MoneyLoadingState());
    DioHelper.getUserwallet(token:API_KEY ).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        money.add(Walletmodel.fromJson(value.data['Data'][i]));
      }
      print('wallet length: ${money.length}');
      emit(MoneySuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(MoneyErrorState());
    });
  }
  gethallwallet() {
    emit(MoneyLoadingState());
    DioHelper.gethallwallet(token:API_KEY ).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        money.add(Walletmodel.fromJson(value.data['Data'][i]));
      }
      print('wallet length: ${money.length}');
      emit(MoneySuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(MoneyErrorState());
    });
  }
  getownerwallet() {
    emit(MoneyLoadingState());
    DioHelper.getownerwallet(token:API_KEY ).then((value) {
      print(value.data);
      for (int i = 0; i < value.data['Data'].length; i++) {
        money.add(Walletmodel.fromJson(value.data['Data'][i]));
      }
      print('wallet length: ${money.length}');
      emit(MoneySuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(MoneyErrorState());
    });
  }

}

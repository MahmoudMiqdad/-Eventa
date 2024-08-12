import 'package:eventa_project/cubit/public_event_cubit/state.dart';
import 'package:eventa_project/data/model/create_event_model.dart';
import 'package:eventa_project/data/model/public_event.dart';
import 'package:eventa_project/repositories/user/public_event/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';

class Pupliceventcubit extends Cubit<Pupliceventstate> {
  Pupliceventcubit(this.pupliceventRepository) : super(UserInitial());
  final public_eventRepository pupliceventRepository;
 
  PublicEventResponse? event;

  

  getPuplicevent() async {
    emit(GetEventLoading());
    final response = await pupliceventRepository.displaypublicevents();
    response.fold(
      (errMessage) => emit(GetEventFailure(errMessage: errMessage)),
      (user) => emit(GetEventSuccess(event: event!)),
    );
  }
}

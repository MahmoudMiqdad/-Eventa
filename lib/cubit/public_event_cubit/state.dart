

import 'package:eventa_project/data/model/public_event.dart';

class Pupliceventstate {}

final class UserInitial extends Pupliceventstate {}
final class GetEventSuccess extends Pupliceventstate {
  final  PublicEventResponse event;

  GetEventSuccess({required this.event});
}

final class GetEventLoading extends Pupliceventstate {}

final class GetEventFailure extends Pupliceventstate {
  final String errMessage;

  GetEventFailure({required this.errMessage});
}

import 'package:dartz/dartz.dart';
import 'package:eventa_project/core/api/api_consumer.dart';
import 'package:eventa_project/core/api/end_ponits.dart';
import 'package:eventa_project/core/errors/exception.dart';
import 'package:eventa_project/data/model/public_event.dart';


class public_eventRepository {
  final ApiConsumer api;

  public_eventRepository({required this.api});

 
  
  Future<Either<String, PublicEventResponse>> displaypublicevents() async {
    try {
      final response = await api.get(
        EndPoint.Display_public_eventst(
         1
        ),
      );
      return Right(PublicEventResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:eventa_project/cache/cache_helper.dart';
import 'package:eventa_project/core/api/api_consumer.dart';
import 'package:eventa_project/core/api/end_ponits.dart';
import 'package:eventa_project/core/errors/error_model.dart';
import 'package:eventa_project/core/errors/error_model.dart';
import 'package:eventa_project/core/errors/exception.dart';
import 'package:eventa_project/data/model/create_event_model.dart';

import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AothUser {
  final ApiConsumer api;

  AothUser({required this.api});
  // Future<Either<String, SignInModel>> signIn({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await api.post(
  //       EndPoint.User_register,
  //       data: {
  //         ApiKey.email: email,
  //         ApiKey.password: password,
  //       },
  //     );
  //     final user = SignInModel.fromJson(response);
  //     final decodedToken = JwtDecoder.decode(user.token);
  //     CacheHelper().saveData(key: ApiKey.token, value: user.token);
  //     CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
  //     return Right(user);
  //   } on ServerException catch (e) {
  //     return Left(e.errorModel.message);
  //   }
  // }

  // Future<Either<String, SignUpModel>> signUp({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required XFile profilePic,
  // }) async {
  //   try {
  //     final response = await api.post(
  //       EndPoint.signUp,
  //       isFromData: true,
  //       data: {
  //         ApiKey.name: name,
  //         ApiKey.phone: phone,
  //         ApiKey.email: email,
  //         ApiKey.password: password,
  //         ApiKey.confirmPassword: confirmPassword,
  //         ApiKey.location:
  //             '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
  //         ApiKey.profilePic: await uploadImageToAPI(profilePic)
  //       },
  //     );
  //     // final signUPModel = SignUpModel.fromJson(response);
  //     return Right(signUPModel);
  //   } on ServerException catch (e) {
  //     return Left(e.errorModel.message);
  //   }
  // }

}

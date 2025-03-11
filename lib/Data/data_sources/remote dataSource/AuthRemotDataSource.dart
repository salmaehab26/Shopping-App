import 'package:dartz/dartz.dart';

import '../../../Domain/Failures.dart';
import '../../../Domain/entities/Sign_up_response_entity.dart';

abstract class AuthRemotDataSource{
  Future<Either<Failures, SignUpResponseEntity>> SignUp(String name,
      String email, String password, String rePassword, String phone);
}
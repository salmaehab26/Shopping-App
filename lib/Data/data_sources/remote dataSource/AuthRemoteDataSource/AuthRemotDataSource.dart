import 'package:dartz/dartz.dart';

import '../../../../Domain/Failures.dart';
import '../../../../Domain/entities/LogInResponseEntity.dart';
import '../../../../Domain/entities/SignUpResponseEntity.dart';

abstract class AuthRemotDataSource{
  Future<Either<Failures, SignUpResponseEntity>> SignUp(String name,
      String email, String password, String rePassword, String phone);


  Future<Either<Failures, LogInResponseEntity>> LogIn(
      String email, String password);

}
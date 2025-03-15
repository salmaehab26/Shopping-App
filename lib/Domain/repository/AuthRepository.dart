import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/entities/SignUpResponseEntity.dart';

import '../Failures.dart';
import '../entities/LogInResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, SignUpResponseEntity>> SignUp(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LogInResponseEntity>> LogIn(
      String email, String password);
}

import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/entities/Sign_up_response_entity.dart';

import '../Failures.dart';

abstract class SignUpRepository {
  Future<Either<Failures, SignUpResponseEntity>> SignUp(String name,
      String email, String password, String rePassword, String phone);
}

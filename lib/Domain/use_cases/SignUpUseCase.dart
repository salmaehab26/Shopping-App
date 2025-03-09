import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Domain/repository/SignUpRepository.dart';

import '../Failures.dart';
import '../entities/Sign_up_response_entity.dart';

class SignUpUseCase{
  SignUpRepository  signUpRepository;
  SignUpUseCase({required this.signUpRepository});
  Future<Either<Failures, SignUpResponseEntity>>invoke(String name,
      String email, String password, String rePassword, String phone){
    return signUpRepository.SignUp(name, email, password, rePassword, phone);
  }
}
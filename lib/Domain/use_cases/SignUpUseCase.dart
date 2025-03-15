import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/repository/AuthRepository.dart';

import '../Failures.dart';
import '../entities/SignUpResponseEntity.dart';
@injectable
class SignUpUseCase{
  AuthRepository  signUpRepository;
  SignUpUseCase({required this.signUpRepository});
  Future<Either<Failures, SignUpResponseEntity>>invoke(String name,
      String email, String password, String rePassword, String phone){
    return signUpRepository.SignUp(name, email, password, rePassword, phone);
  }
}
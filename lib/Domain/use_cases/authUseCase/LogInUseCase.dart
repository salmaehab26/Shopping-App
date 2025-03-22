import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/repository/AuthRepository.dart';

import '../../Failures.dart';
import '../../entities/LogInResponseEntity.dart';
@injectable
class LogInUseCase {
  AuthRepository LoginRepository;

  LogInUseCase({required this.LoginRepository});

  Future<Either<Failures, LogInResponseEntity>> call(
      String email, String password) {
    return LoginRepository.LogIn(email, password);
  }
}

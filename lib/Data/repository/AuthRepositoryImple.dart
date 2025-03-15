import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Data/data_sources/remote%20dataSource/AuthRemotDataSource.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/LogInResponseEntity.dart';
import 'package:shopping/Domain/entities/SignUpResponseEntity.dart';

import '../../Domain/repository/AuthRepository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImple implements AuthRepository {
  AuthRemotDataSource authRemotDataSource;

  AuthRepositoryImple({required this.authRemotDataSource});

  @override
  Future<Either<Failures, SignUpResponseEntity>> SignUp(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await authRemotDataSource.SignUp(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LogInResponseEntity>> LogIn(
      String email, String password) async {
    var response = await authRemotDataSource.LogIn(email, password);
    return response.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}

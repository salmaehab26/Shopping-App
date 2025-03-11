import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Data/data_sources/remote%20dataSource/AuthRemotDataSource.dart';
import 'package:shopping/Data/model/Sign_up_response_Dto.dart';

import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/Sign_up_response_entity.dart';


import '../../Domain/repository/AuthRepository.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImple implements AuthRepository{
  AuthRemotDataSource authRemotDataSource;
  AuthRepositoryImple({required this.authRemotDataSource});
  @override
  Future<Either<Failures, SignUpResponseEntity>> SignUp (String name, String email, String password, String rePassword, String phone) async {
    var either= await authRemotDataSource.SignUp(name, email, password, rePassword, phone);
    return either.fold((error) =>Left(error) , (response) => Right(response) );
  }
}
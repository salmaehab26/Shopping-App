import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Data/ApiManager.dart';
import 'package:shopping/Data/EndPoints.dart';
import 'package:shopping/Data/model/Sign_up_response_Dto.dart';

import 'package:shopping/Domain/Failures.dart';

import 'package:shopping/Domain/entities/Sign_up_response_entity.dart';

import 'AuthRemotDataSource.dart';
@Injectable(as: AuthRemotDataSource)
class AuthRemotDataSourceImpl implements AuthRemotDataSource {
  ApiManager apiManager;

  AuthRemotDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, SignUpResponseEntity>> SignUp(String name,
      String email, String password, String rePassword, String phone) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response= await apiManager.postData(EndPoints.SignUp, body: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,}
      );
     var signUpResponse= SignUpResponseDto.fromJson(response);
     if(response.statusCode! <= 200&&response.statusCode! < 300){
      return Right(signUpResponse);
    }else
    {return Left(errorServer(ErrorMessage: response.statusMessage));}}
    else {
      return Left(errorNetwork(ErrorMessage: "ErrorMessage"));
    }
    }
  }

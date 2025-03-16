import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Core/resources/ApiManager.dart';
import 'package:shopping/Core/resources/EndPoints.dart';
import 'package:shopping/Data/model/LogInResponseDto.dart';
import 'package:shopping/Data/model/SignUpResponseDto.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/LogInResponseEntity.dart';
import 'package:shopping/Domain/entities/SignUpResponseEntity.dart';
import 'AuthRemotDataSource.dart';

@Injectable(as: AuthRemotDataSource)
class AuthRemotDataSourceImpl implements AuthRemotDataSource {
  ApiManager apiManager;

  AuthRemotDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, SignUpResponseEntity>> SignUp(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(EndPoints.SignUp, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        });
        var responseData = response.data;
        var responseSignUp = SignUpResponseDto.fromJson(responseData);

        if (response.statusCode! <= 200 && response.statusCode! < 300) {
          return Right(responseSignUp);
        } else {
          return Left(errorServer(ErrorMessage: responseSignUp.message));
        }
      } else {
        return Left(errorNetwork(ErrorMessage: "ErrorMessage"));
        //
      }
    } catch (e) {
      return Left(Failures(ErrorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LogInResponseEntity>> LogIn(
      String email, String password) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    try {
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await apiManager.postData(EndPoints.LogIn, body: {
        "email": email,
        "password": password,
      });
      var responsedata= response.data;
     var responseData=LogInResponseDto.fromJson(responsedata);
      if(response.statusCode! <=200&&response.statusCode!<300) {
        return Right(responseData);

      }
      else{
        return Left(errorServer(ErrorMessage:responseData.message ));
      }
    }
    else{
      return Left(errorNetwork(ErrorMessage: "Error Network Message"));
    }
  }
  catch (e) {
    return Left(Failures(ErrorMessage: e.toString()));
  }
  }
}

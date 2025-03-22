


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:shopping/Core/resources/ApiManager.dart';
import 'package:shopping/Core/resources/EndPoints.dart';
import 'package:shopping/Data/model/AllCategorisResponseDto.dart';

import 'package:shopping/Domain/Failures.dart';

import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';

import 'AllCategoryRemoteDataSource.dart';

class AllCategoryRemoteDataSourceImple implements AllCategoryRemoteDataSource{
  AllCategoryRemoteDataSourceImple({required this.apiManager});
    ApiManager apiManager;
  @override
  Future<Either<Failures, AllCategoriesResponseEntity>> getAllCategories() async {

 try {
   final List<ConnectivityResult> connectivityResult =
   await (Connectivity().checkConnectivity());

   if (connectivityResult.contains(ConnectivityResult.mobile) ||
       connectivityResult.contains(ConnectivityResult.wifi)) {
     var response =  await apiManager.getData(EndPoints.AllCategories);
     var responseData=AllCategoriesResponseDto.fromJson(response.data);
     if (response.statusCode! <= 200 && response.statusCode! < 300) {
       return Right(responseData);
     } else {
       return Left(errorServer(ErrorMessage: responseData.message));
     }
   } else {
     return Left(errorNetwork(ErrorMessage: "ErrorMessage"));
     //
   }
 } catch (e) {
   return Left(Failures(ErrorMessage: e.toString()));
 }
  }

  }
  

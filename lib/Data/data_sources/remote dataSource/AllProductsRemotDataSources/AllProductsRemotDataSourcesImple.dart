import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Core/resources/ApiManager.dart';
import 'package:shopping/Core/resources/EndPoints.dart';
import 'package:shopping/Data/model/AllProductesResponseDto.dart';

import 'package:shopping/Domain/Failures.dart';

import 'package:shopping/Domain/entities/AllProductesResponseEntity.dart';

import 'AllProductsRemotDataSources.dart';
@Injectable(as: AllProductsRemotDataSources)
class AllProductsRemotDataSourcesImple implements AllProductsRemotDataSources {
  @override
  Future<Either<Failures, AllProductesResponseEntity>> AllProducts() async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    try {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await ApiManager().getData(EndPoints.AllProducts);
        var responseData = AllProductesResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 || response.statusCode! < 300) {
          return Right(responseData);
        } else {
          return Left(errorNetwork(ErrorMessage: responseData.message));
        }
      } else {
       return Left(errorServer(ErrorMessage: 'error server'));
      }
    } catch (e) {
      return Left(errorServer(ErrorMessage: e.toString()));
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Data/data_sources/remote%20dataSource/AllProductsRemotDataSources/AllProductsRemotDataSources.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllProductesResponseEntity.dart';
import 'package:shopping/Domain/repository/AllProductesRepository.dart';
@Injectable(as: AllProductsRepository)
class AllProductsRepositoryImple implements AllProductsRepository {
  AllProductsRemotDataSources allProductsRemotDataSources;
  AllProductsRepositoryImple({required this.allProductsRemotDataSources});
  @override
  Future<Either<Failures, AllProductesResponseEntity>> AllProducts() async {
    var response=await allProductsRemotDataSources.AllProducts();
    return response.fold((l) =>Left(l) , (r) => Right(r),);
  }

}
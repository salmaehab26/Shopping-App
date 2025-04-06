import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
import 'package:shopping/Domain/repository/AllCategoryORBrandsRepository.dart';

import '../data_sources/remote dataSource/AllCategoriesORBrandsDataSource/AllCategoryORBrandsRemoteDataSource.dart';
@Injectable(as:AllCategoryORBrandsRepository)

class AllCategoryORBrandsRepositoryImple implements AllCategoryORBrandsRepository {
  @override
  AllCategoryORBrandsRepositoryImple({required this.allCategoryORBrandsRemoteDataSource});

  AllCategoryORBrandsRemoteDataSource allCategoryORBrandsRemoteDataSource;

  Future<Either<Failures, AllCategoriesORBrandsResponseEntity>> getCategories() async {
    var either = await allCategoryORBrandsRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AllCategoriesORBrandsResponseEntity>> getBrands()async {
    var either = await allCategoryORBrandsRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}

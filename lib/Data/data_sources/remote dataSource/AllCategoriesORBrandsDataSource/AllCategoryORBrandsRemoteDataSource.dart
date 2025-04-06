import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';

abstract class AllCategoryORBrandsRemoteDataSource{

  Future<Either<Failures,AllCategoriesORBrandsResponseEntity>>getAllCategories();
  Future<Either<Failures,AllCategoriesORBrandsResponseEntity>>getAllBrands();
}
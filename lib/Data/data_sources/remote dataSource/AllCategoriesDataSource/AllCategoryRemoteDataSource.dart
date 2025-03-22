import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';

abstract class AllCategoryRemoteDataSource{

  Future<Either<Failures,AllCategoriesResponseEntity>>getAllCategories();
}
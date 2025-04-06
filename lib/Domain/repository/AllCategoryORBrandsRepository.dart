import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
abstract class AllCategoryORBrandsRepository {

 Future<Either<Failures,AllCategoriesORBrandsResponseEntity>> getCategories();
 Future<Either<Failures,AllCategoriesORBrandsResponseEntity>> getBrands();
}
import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';

abstract class AllCategoryRepository {

 Future<Either<Failures,AllCategoriesResponseEntity>> getCategories();
}
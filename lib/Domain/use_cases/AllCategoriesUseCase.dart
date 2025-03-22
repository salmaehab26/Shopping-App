import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
import 'package:shopping/Domain/repository/AllCategoryRepository.dart';

class AllCategoriesUseCase{
  AllCategoryRepository allCategoryRepository;
  AllCategoriesUseCase({required this.allCategoryRepository});
  Future<Either<Failures,AllCategoriesResponseEntity>>invoke(){

    return allCategoryRepository.getCategories();
  }
}
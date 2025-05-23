import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
import 'package:shopping/Domain/repository/AllCategoryORBrandsRepository.dart';
@injectable
class AllCategoriesUseCase{
  AllCategoryORBrandsRepository allCategoryRepository;
  AllCategoriesUseCase({required this.allCategoryRepository});
  Future<Either<Failures,AllCategoriesORBrandsResponseEntity>>invoke(){
    return allCategoryRepository.getCategories();
  }
}
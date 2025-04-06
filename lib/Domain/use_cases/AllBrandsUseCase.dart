import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
import 'package:shopping/Domain/repository/AllCategoryORBrandsRepository.dart';
@injectable
class AllBrandsUseCase{
  AllCategoryORBrandsRepository allBrandsRepository;
  AllBrandsUseCase({required this.allBrandsRepository});
  Future<Either<Failures,AllCategoriesORBrandsResponseEntity>>invoke()async{
    return allBrandsRepository.getBrands();

  }
}
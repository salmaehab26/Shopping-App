import 'package:dartz/dartz.dart';
import 'package:shopping/Data/data_sources/remote%20dataSource/AllCategoriesDataSource/AllCategoryRemoteDataSource.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
import 'package:shopping/Domain/repository/AllCategoryRepository.dart';

class AllCategoryRepositoryImple implements AllCategoryRepository {
  @override
  AllCategoryRepositoryImple({required this.allCategoryRemoteDataSource});

  AllCategoryRemoteDataSource allCategoryRemoteDataSource;

  Future<Either<Failures, AllCategoriesResponseEntity>> getCategories() async {
    var either = await allCategoryRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}

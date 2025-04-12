import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/repository/AllProductesRepository.dart';

import '../Failures.dart';
import '../entities/AllProductesResponseEntity.dart';
@injectable
class AllProductsUseCase{
  AllProductsUseCase({required this.allProductsRepository});
  AllProductsRepository allProductsRepository;
  Future<Either<Failures,AllProductesResponseEntity>>invoke(){
    return allProductsRepository.AllProducts();

  }

}
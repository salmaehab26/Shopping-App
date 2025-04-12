import 'package:dartz/dartz.dart';
import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllProductesResponseEntity.dart';

abstract class AllProductsRepository{
  Future<Either<Failures,AllProductesResponseEntity>>AllProducts();
}
import 'package:dartz/dartz.dart';

import '../../../../Domain/Failures.dart';
import '../../../../Domain/entities/AllProductesResponseEntity.dart';

abstract class AllProductsRemotDataSources{
  Future<Either<Failures,AllProductesResponseEntity>>AllProducts();

}
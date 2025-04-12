import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllProductesResponseEntity.dart';

abstract class AllProductsStates{}
class AllProdutsInitStates extends AllProductsStates{}
class AllProdutsLoadingStates extends AllProductsStates{}
class AllProdutsErrorgStates extends AllProductsStates{
  Failures failures;
  AllProdutsErrorgStates ({required this.failures});
}
class AllProdutsSuccesStates extends AllProductsStates{
  AllProductesResponseEntity allProductesResponseEntity;
  AllProdutsSuccesStates ({required this.allProductesResponseEntity});
}

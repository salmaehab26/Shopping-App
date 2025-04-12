import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';

abstract class HomeScreenStates{}
class HomeCategoriesIORBrandsnitState extends HomeScreenStates{}
class HomeCategoriesLoadingStates extends HomeScreenStates{}
class HomeCategoriesErrorStates extends HomeScreenStates{
  Failures failures;
  HomeCategoriesErrorStates({required this.failures});
}
class HomeCategoriesSuccesStates extends HomeScreenStates{
  AllCategoriesORBrandsResponseEntity allCategoriesResponseEntity;
  HomeCategoriesSuccesStates ({required this.allCategoriesResponseEntity});
}
class HomeBrandsLoadingStates extends HomeScreenStates{}
class HomeBrandsErrorStates extends HomeScreenStates{
  Failures failures;
  HomeBrandsErrorStates({required this.failures});
}
class HomeBrandsSuccesStates extends HomeScreenStates{
  AllCategoriesORBrandsResponseEntity allBrandsResponseEntity;
  HomeBrandsSuccesStates ({required this.allBrandsResponseEntity});
}

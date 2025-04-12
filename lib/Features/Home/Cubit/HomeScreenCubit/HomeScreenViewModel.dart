import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/use_cases/AllCategoriesUseCase.dart';
import 'package:shopping/Domain/use_cases/AllBrandsUseCase.dart';
import 'package:shopping/Features/Home/Cubit/HomeScreenCubit/HomeScreenStates.dart';

import '../../../../Domain/entities/AllCategoriesResponseEntity.dart';
@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel({required this.allCategoriesUseCase,required this.allBrandsUseCase})
      : super(HomeCategoriesIORBrandsnitState());
  AllCategoriesUseCase allCategoriesUseCase;
  AllBrandsUseCase allBrandsUseCase;
  List<DataEntity> categoryList=[];
  List<DataEntity> BrandList=[];

  void getCategories() async {

    emit(HomeCategoriesLoadingStates());
    var response = await allCategoriesUseCase.invoke();
    response.fold((l) {
      emit(HomeCategoriesErrorStates(failures: l));
    }, (r) {
      categoryList = r.data!;
      emit(HomeCategoriesSuccesStates(allCategoriesResponseEntity: r));
    });
  }
  void getBrands() async {

    emit(HomeBrandsLoadingStates());
    var response = await allBrandsUseCase.invoke();
    response.fold((l) {
      emit(HomeBrandsErrorStates(failures: l));
    }, (r) {
      BrandList = r.data!;

      emit(HomeBrandsSuccesStates(allBrandsResponseEntity: r));
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/entities/AllProductesResponseEntity.dart';
import 'package:shopping/Domain/use_cases/AllProductsUseCase.dart';
import 'package:shopping/Features/Home/Cubit/AllProductsCubit/AllProdutsStates.dart';
@injectable
class AllProductsViewModel extends Cubit<AllProductsStates> {
  AllProductsViewModel(
      {required this.allProductsUseCase})
      : super(AllProdutsInitStates());
  AllProductsUseCase allProductsUseCase;
  List<ProductEntity> products=[];

  void getAllProducts() async {
    emit(AllProdutsLoadingStates());
    var response = await allProductsUseCase.invoke();
    response.fold(
      (l) {
        emit(AllProdutsErrorgStates(failures: l));
      },
      (r) {
        products = r.data!;
        emit(AllProdutsSuccesStates(allProductesResponseEntity: r));
      },
    );
  }

  static AllProductsViewModel get(context) => BlocProvider.of(context);
}

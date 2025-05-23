import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Features/Home/parts/announcement.dart';
import '../../../di/DependencyInjection.dart';
import '../Cubit/HomeScreenCubit/HomeScreenStates.dart';
import '../Cubit/HomeScreenCubit/HomeScreenViewModel.dart';
import '../parts/CartegoryGrid.dart';
import '../parts/categoryBar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  HomeScreenViewModel viewModel=getIt<HomeScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
        bloc:viewModel..getCategories()..getBrands(),
        builder: (context,state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Announcement(),
                CustomSectionBar(NameSection: "Categories",),
                state is HomeCategoriesLoadingStates ?
              CircularProgressIndicator():  CartegoryGrid( category:viewModel.categoryList),
                CustomSectionBar(NameSection: "Brands",),
                state is HomeBrandsLoadingStates ?
               CircularProgressIndicator():CartegoryGrid( category:viewModel.BrandList)

              ],
            ),
          );
        });
  }
}

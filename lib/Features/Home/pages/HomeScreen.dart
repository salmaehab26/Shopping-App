import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Features/Home/parts/announcement.dart';
import '../../../di/DependencyInjection.dart';
import '../Cubit/HomeScreenStates.dart';
import '../Cubit/HomeScreenViewModel.dart';
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
                state is HomeCategoriesSuccesStates ?
                CartegoryGrid( category:state.allCategoriesResponseEntity):CircularProgressIndicator(),
                CustomSectionBar(NameSection: "Brands",),
                state is HomeBrandsSuccesStates ?
                CartegoryGrid( category:state.allBrandsResponseEntity):CircularProgressIndicator(),

              ],
            ),
          );
        });
  }
}

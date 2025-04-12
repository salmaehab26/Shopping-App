import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Core/resources/my_colors.dart';
import 'package:shopping/Features/Home/Cubit/MainScreenCubit/MainScreenStates.dart';
import 'package:shopping/Features/Home/Cubit/MainScreenCubit/MainScreenViewModel.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  MainScreenViewModel viewModel = MainScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenViewModel, MainScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: viewModel.Tabs[viewModel.currentIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: BottomNavigationBar(
              onTap: (value) {
                viewModel.Changeselectindex(value);
              },
              iconSize: 30,
              currentIndex: viewModel.currentIndex,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "home",
                    backgroundColor: AppColors.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_rounded),
                    label: "Products",
                    backgroundColor: AppColors.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart_fill),
                    label: "WishList",
                    backgroundColor: AppColors.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person_alt),
                    label: "Profile",
                    backgroundColor: AppColors.primaryColor),
              ],
            ),
          ),
        );
      },
    );
  }
}

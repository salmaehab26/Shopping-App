import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Core/resources/my_colors.dart';
import 'package:shopping/Features/Home/Cubit/MainScreenStates.dart';
import 'package:shopping/Features/Home/Cubit/MainScreenViewModel.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, MainScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          
body: viewModel.Tabs[viewModel.currentIndex],
          bottomNavigationBar: ClipRRect(borderRadius:BorderRadius.vertical(top:Radius.circular(30) ),
          child: BottomNavigationBar(
            onTap: (value) {
              viewModel.Changeselectindex(value);
            },
            // type: BottomNavigationBarType.fixed,

            iconSize: 25,
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
                  label: "Category",
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
          ),),

        );
      },
    );
  }
}

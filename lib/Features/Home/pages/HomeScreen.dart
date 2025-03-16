import 'package:flutter/material.dart';
import 'package:shopping/Core/resources/my_colors.dart';
import 'package:shopping/Features/Home/parts/announcement.dart';
import '../parts/CartegoryGrid.dart';
import '../parts/categoryBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Announcement(),
              CustomSectionBar(NameSection: "Categories",),
              CartegoryGrid(),
              CustomSectionBar(NameSection: "Brands",),

            ],
          ),
        ),
      ),
    );
  }
}

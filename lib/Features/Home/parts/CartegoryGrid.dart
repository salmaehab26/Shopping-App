import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
import 'package:shopping/Features/Home/Cubit/HomeScreenStates.dart';

import '../../../di/DependencyInjection.dart';
import '../Cubit/HomeScreenViewModel.dart';
import 'CategoryItem.dart';

class CartegoryGrid extends StatelessWidget {
   CartegoryGrid({super.key,required this.category});
List<DataEntity> category;
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Expanded(
            child: Container(
              height: 250.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return CaregoryItem(category: category, index: index,);
                },
              ),
            ),
          ),
        ],
      );
  }}

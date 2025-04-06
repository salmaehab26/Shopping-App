import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Domain/entities/AllCategoriesResponseEntity.dart';
import 'package:shopping/Features/Home/Cubit/HomeScreenStates.dart';
import 'package:shopping/Features/Home/Cubit/HomeScreenViewModel.dart';
import 'package:shopping/di/DependencyInjection.dart';

class CaregoryItem extends StatelessWidget {
   CaregoryItem({super.key,required this.category});
   DataEntity category;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Container(
              width: 100.w,
              height: 100.h,
              child: CachedNetworkImage(imageUrl: category.image!,

                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(category.name!)
        ],
      );

  }
}

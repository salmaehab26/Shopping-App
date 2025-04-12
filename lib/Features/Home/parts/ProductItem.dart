import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Core/resources/my_colors.dart';
import 'package:shopping/Core/routes_manager/app_routes.dart';
import 'package:shopping/Domain/entities/AllProductesResponseEntity.dart';
import 'package:shopping/Features/Home/Cubit/AllProductsCubit/AllProductsViewModel.dart';

import '../Screens/ProductDetails.dart';

class Productitem extends StatelessWidget {
  Productitem({super.key, required this.products, required this.index});

  List<ProductEntity> products;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => Productdetails(productEntity: AllProductsViewModel.get(context).products[index],)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.darkPrimaryColor)),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  child: CachedNetworkImage(
                    imageUrl: AllProductsViewModel.get(context)
                        .products[index]
                        .imageCover!,
                    fit: BoxFit.cover,
                  ),
                  width: 160.w,
                  height: 130.h,
                ),
                // Image.asset("assets/flowers.jpeg", width: 191.w, height: 128.h,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.all(8),
                width: 191.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AllProductsViewModel.get(context).products[index].title!,
                      style: TextStyle(color: AppColors.darkPrimaryColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                        AllProductsViewModel.get(context)
                            .products[index]
                            .description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.darkPrimaryColor)),
                    Text(
                      "EGP ${AllProductsViewModel.get(context).products[index].price!.toString()}",
                      style: TextStyle(color: AppColors.darkPrimaryColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            AllProductsViewModel.get(context)
                                .products[index]
                                .ratingsAverage!
                                .toString(),
                            style:
                                TextStyle(color: AppColors.darkPrimaryColor)),
                        Icon(CupertinoIcons.add_circled)
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

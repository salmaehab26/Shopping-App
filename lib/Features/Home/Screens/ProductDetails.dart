import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Core/resources/app_styles.dart';
import 'package:shopping/Core/resources/my_colors.dart';

import '../../../Core/widgets/custom_elevated_button.dart';
import '../../../Domain/entities/AllProductesResponseEntity.dart';

class Productdetails extends StatelessWidget {
  Productdetails({super.key, required this.productEntity});

  ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productdetails"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Center(
                  child: Container(
                      width: 400.w,
                      height: 250.h,
                      child: Swiper(
                        pagination: SwiperPagination(),
                        // control: SwiperControl(),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.darkPrimaryColor, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: productEntity.images![index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        itemCount: productEntity.images!.length,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35, top: 20),
                  child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.darkPrimaryColor,
                      )),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(productEntity.title!,style: AppStyles.black16text),
                Text('EGP ${productEntity.price}',style: AppStyles.black16text),
              ],
            ),
            SizedBox(height: 20.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40.h,
                    width: 102.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppColors.darkPrimaryColor),
                    ),
                    child: Center(
                        child: Text("${productEntity.sold.toString()!} Sold"))),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    Text('${productEntity.ratingsAverage}'),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkPrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 122.w,
                  height: 42.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(CupertinoIcons.minus_circle,
                            color: AppColors.whiteColor),
                      ),
                      Text("1"),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          CupertinoIcons.plus_circle,
                          color: AppColors.whiteColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text("Description",style: AppStyles.black16text,),
            Text(productEntity.description!,style: AppStyles.gray14Text,),
            SizedBox(height: 20.h,),

            Text("Colors"),
            Container(
              width: 170.w,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ), InkWell(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ), InkWell(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ), InkWell(
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    )
                  ],
                ),
              ),
            ),  SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text('Total price', style: AppStyles.black16text),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('EGP ${productEntity.price}',
                        style: AppStyles.black16text.copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    prefixIcon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: AppColors.whiteColor,
                    ),
                    text: 'Add to cart',
                    onPressed: () {},
                    backgroundColor: AppColors.darkPrimaryColor,
                    textStyle: AppStyles.white15text,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Announcement extends StatelessWidget {
  const   Announcement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        width: 398.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image(
                image: AssetImage(
                  "assets/Slider/$index.png",
                ),
                fit: BoxFit.fill,
              );
            },
            itemCount: 3,
            pagination: SwiperPagination(),
            control: SwiperControl(),
          ),
        ),

    );
  }
}

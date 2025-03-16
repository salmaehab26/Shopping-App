import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaregoryItem extends StatelessWidget {
  const CaregoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Container(
            width: 100.w,
            height: 100.h,
            child: Image(
              image: AssetImage("assets/flowers.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text("fashon")
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Core/resources/app_styles.dart';
import 'package:shopping/Core/resources/my_colors.dart';

class CustomSectionBar extends StatelessWidget {
   CustomSectionBar({super.key,required this.NameSection});
String NameSection;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
          height: 45.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(NameSection, style: AppStyles.darkprimry18Text),
              TextButton(
                onPressed: () {},
                child: Text('view all', style: AppStyles.regular12Text),
              ),
            ],
          ),

      ),
    );
  }
}

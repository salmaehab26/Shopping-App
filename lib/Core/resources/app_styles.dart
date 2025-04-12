import 'dart:ui';
import 'package:flutter/material.dart';
import 'my_colors.dart';

class AppStyles {
  static TextStyle regular12Text = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.blackColor);
  static TextStyle darkprimry18Text = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.darkPrimaryColor);

  // static TextStyle regular12Text = TextStyle(
  //     fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.blackColor);
  static TextStyle red14Text = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.redColor);
  static TextStyle white15text = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.whiteColor);
  static TextStyle black14Text = TextStyle(color: AppColors.blackColor,fontSize: 14);
  static TextStyle gray14Text = TextStyle(color: AppColors.greyColor,fontSize: 14);
  static TextStyle black16text = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.blackColor);
  static TextStyle primary30text = TextStyle(
      fontSize: 30, fontWeight: FontWeight.w500, color: AppColors.primaryColor);
}

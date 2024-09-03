
import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppTheme{
  static ThemeData appTheme=ThemeData(
    primaryColor: MyAppColors.primaryColor,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: MyAppColors.whiteColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500 //medium
      ),
      titleLarge: TextStyle( //buttons
        color: MyAppColors.primaryColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700 //semibold
      ) ,
      bodyLarge:  TextStyle(
        color: MyAppColors.whiteColor ,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700
      ),
      titleSmall:  TextStyle(
        color: MyAppColors.whiteColor,
        fontSize: 18.sp,
      )

    )
  );
}
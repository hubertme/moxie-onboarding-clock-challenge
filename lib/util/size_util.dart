import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding_clock_challenge/constants/design_size.dart';

class SizeUtil {
  SizeUtil._() {}

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double scaleWidth(double width) {
    double scaledWidth = ScreenUtil().setWidth(width).toDouble();
    return scaledWidth;
  }

  static double scaleHeight(double height) {
    double scaledHeight = ScreenUtil().setHeight(height).toDouble();
    return scaledHeight;
  }

  static double scaleFontSize(double fontSize) {
    const double DEFAULT_SIZE = 14;
    if (fontSize <= 0) {
      fontSize = DEFAULT_SIZE;
    }

    double scaledSize = ScreenUtil().setSp(fontSize).toDouble();
    return scaledSize;
  }
}
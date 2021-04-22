import 'package:flutter/material.dart';
import 'package:onboarding_clock_challenge/components/uniform/uniform_text.dart';
import 'package:onboarding_clock_challenge/constants/app_colors.dart';
import 'package:onboarding_clock_challenge/constants/design_size.dart';
import 'package:onboarding_clock_challenge/util/size_util.dart';

class UniformAppBar extends StatelessWidget implements PreferredSizeWidget {
  String _title;

  UniformAppBar({
    String title,
  }) {
    this._title = title;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: UniformText(
        color: AppColors.WHITE,
        text: this._title,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize {
    return Size(
      SizeUtil.scaleWidth(DesignSize.WIDTH),
      SizeUtil.scaleHeight(DesignSize.HEIGHT * 0.064),
    );
  }
}

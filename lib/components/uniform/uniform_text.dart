import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_clock_challenge/constants/app_colors.dart';
import 'package:onboarding_clock_challenge/util/size_util.dart';

class UniformText extends StatelessWidget {
  // Attributes
  final String text;
  final double fontSize;
  FontWeight fontWeight = FontWeight.w500;
  Color color = AppColors.BLACK;
  TextAlign textAlign = TextAlign.center;
  num maxLines;
  TextDecoration textDecoration = TextDecoration.none;
  TextOverflow overflow = TextOverflow.clip;

  UniformText({
    @required this.text,
    @required this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.textDecoration,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text ?? "",
      maxLines: this.maxLines,
      textAlign: this.textAlign,
      overflow: this.overflow,
      style: GoogleFonts.openSans(
        // letterSpacing: -0.45,
        fontSize: SizeUtil.scaleFontSize(this.fontSize),
        fontWeight: this.fontWeight,
        color: this.color,
        decoration: this.textDecoration,
      ),
    );
  }
}

part of '../theme.dart';

class AppTextStyle extends TextStyle {
  const AppTextStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.text,
    double height = 1.0,
  }) : super(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: 'Inter',
          height: height,
        );
}

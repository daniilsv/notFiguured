part of '../theme.dart';

class AppStylesSmall {
  static const TextStyle red1Regular = AppTextStyle(
    fontSize: 15,
    height: 1.6,
    color: AppColors.error,
  );

  static const TextStyle body1Regular = AppTextStyle(fontSize: 15, height: 1.6);

  static const TextStyle body1SemiBold =
      AppTextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.6);

  static const TextStyle body2Regular = AppTextStyle(height: 1.43);

  static const TextStyle body2SemiBold =
      AppTextStyle(fontWeight: FontWeight.w600, height: 1.43);

  static const TextStyle body3Medium =
      AppTextStyle(fontSize: 13, fontWeight: FontWeight.w500, height: 1.385);

  static const TextStyle body3MediumRed = AppTextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.385,
    color: AppColors.error,
  );

  static const TextStyle body3Regular = AppTextStyle(height: 1.385);

  static const TextStyle button1Regular =
      AppTextStyle(fontSize: 15, height: 1.33, color: AppColors.white);

  static const TextStyle button1SemiBold = AppTextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, height: 1.33, color: AppColors.white);

  static const TextStyle headline1Bold =
      AppTextStyle(fontSize: 23, fontWeight: FontWeight.bold, height: 1.13);

  static const TextStyle headline1Regular = AppTextStyle(fontSize: 23, height: 1.13);

  static const TextStyle headline2Bold =
      AppTextStyle(fontSize: 17, fontWeight: FontWeight.bold, height: 1.175);

  static const TextStyle headline2Regular = AppTextStyle(fontSize: 17, height: 1.175);

  static const TextStyle inputs1Medium =
      AppTextStyle(fontSize: 15, fontWeight: FontWeight.w500, height: 1.465);

  static const TextStyle inputs1Regular = AppTextStyle(fontSize: 15, height: 1.465);

  static const TextStyle inputs2TitleRegular = AppTextStyle(fontSize: 12, height: 1.5);
}

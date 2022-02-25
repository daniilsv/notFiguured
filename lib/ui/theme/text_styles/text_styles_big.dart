part of '../theme.dart';

class AppStylesBig {
  static const TextStyle body1Regular = AppTextStyle(fontSize: 17, height: 1.53);
  static const TextStyle body1SemiBold =
      AppTextStyle(fontSize: 17, fontWeight: FontWeight.w600, height: 1.53);

  static const TextStyle body2Regular = AppTextStyle(fontSize: 15, height: 1.46);

  static const TextStyle body2SemiBold =
      AppTextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.46);

  static const TextStyle body3Medium =
      AppTextStyle(fontWeight: FontWeight.w500, height: 1.43);

  static const TextStyle body3MediumRed = AppTextStyle(
    fontWeight: FontWeight.w500,
    height: 1.43,
    color: AppColors.error,
  );

  static const TextStyle body3Regular = AppTextStyle(height: 1.43);

  static const TextStyle button1Regular =
      AppTextStyle(fontSize: 17, height: 1.295, color: AppColors.white);

  static const TextStyle button1SemiBold = AppTextStyle(
      fontSize: 17, fontWeight: FontWeight.w600, height: 1.295, color: AppColors.white);

  static const TextStyle headline1Bold =
      AppTextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.23);

  static const TextStyle headline1Regular = AppTextStyle(fontSize: 26, height: 1.23);

  static const TextStyle headline2Bold =
      AppTextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.1);

  static const TextStyle headline2Regular = AppTextStyle(fontSize: 20, height: 1.1);

  static const TextStyle inputs1Medium =
      AppTextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.375);

  static const TextStyle inputs1Regular =
      AppTextStyle(fontSize: 15, fontWeight: FontWeight.w500, height: 1.465);

  static const TextStyle inputs2TitleRegular = AppTextStyle(fontSize: 12, height: 1.5);
}

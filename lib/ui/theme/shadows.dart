part of 'theme.dart';

class AppShadows {
  static const easy = BoxShadow(
    color: Color(0x08000000),
    blurRadius: 20,
    offset: Offset(0, 5), // changes position of shadow
  );

  static const medium = BoxShadow(
    color: AppColors.shadowMedium,
    blurRadius: 30,
    offset: Offset(0, 15), // changes position of shadow
  );
}

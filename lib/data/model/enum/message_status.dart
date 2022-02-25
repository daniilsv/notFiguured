import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';

enum MessageStatus {
  success,
  error,
  neutral,
}

extension MessageStatusExt on MessageStatus {
  Color get color {
    if (this == MessageStatus.success)
      return AppColors.success;
    else if (this == MessageStatus.error)
      return AppColors.error;
    else
      return AppColors.greyB8;
  }

  IconData get icon {
    if (this == MessageStatus.success)
      return AppIcons.succes;
    else if (this == MessageStatus.error)
      return AppIcons.error;
    else
      return null;
  }
}

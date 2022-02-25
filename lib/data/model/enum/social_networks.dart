import 'package:notfiguured/ui/theme/theme.dart';

enum SocialNetworks {
  google,
  vk,
  ok,
  facebook,
}

extension SocialNetworksExt on SocialNetworks {
  String get imagePath {
    if (this == SocialNetworks.facebook)
      return AppImages.facebook;
    else if (this == SocialNetworks.google)
      return AppImages.google;
    else if (this == SocialNetworks.ok)
      return AppImages.ok;
    else
      return AppImages.vk;
  }
}

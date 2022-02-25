import 'package:notfiguured/data/model/enum/social_networks.dart';
import 'package:notfiguured/ui/components/social_auth/widgets/social_button.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:notfiguured/app/breakpoints.dart';

import 'social_auth_component_model.dart';
import 'widgets/apple_button.dart';

class SocialAuthDependency {
  SocialAuthDependency({
    this.onDone,
    this.setViewModelBusy,
  });
  final void Function(Response<AuthorizationTokens> response) onDone;
  final void Function(bool value) setViewModelBusy;
}

class SocialAuthComponent extends StatelessWidget {
  final SocialAuthDependency dependency;

  const SocialAuthComponent({
    Key key,
    this.dependency,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SocialAuthComponentModel>.reactive(
      viewModelBuilder: () => SocialAuthComponentModel(context, dependency),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: SocialNetworks.values
                  .map(
                    (i) => SocialButton(
                      width: (MediaQuery.of(context).size.width -
                                  [AppPaddings.h25, AppPaddings.h30]
                                      .byHeight
                                      .horizontal) /
                              SocialNetworks.values.length -
                          10,
                      socialNetwork: i,
                      onTap: model.onOAuthTap,
                    ),
                  )
                  .toList(),
            ),
            if (model.needAppleSingIn) ...[
              const SizedBox(height: 20),
              AppleButton(
                onPressed: model.onAppleTap,
              ),
            ],
          ],
        );
      },
    );
  }
}

import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/loading.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';

import 'enter_email_viewmodel.dart';

class EnterEmailRoute extends MaterialPageRoute {
  EnterEmailRoute()
      : super(
          builder: (context) => _EnterEmailView(),
          settings: const RouteSettings(name: 'restoreEnterEmail'),
        );
}

class _EnterEmailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EnterEmailViewModel>.reactive(
      viewModelBuilder: () => EnterEmailViewModel(context),
      // onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AppScaffold(
                title: Strings.current.restore_password,
                contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
                expandedAppBarHeight: 96,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedCrossFade(
                      duration: 150.milliseconds,
                      crossFadeState: MediaQuery.of(context).viewInsets.bottom < 50
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 53),
                        child: Text(Strings.current.restore_password_hint,
                            style: [
                              AppStylesSmall.body1Regular,
                              AppStylesBig.body1Regular
                            ].byHeight.copyWith(color: AppColors.greyB8)),
                      ),
                      secondChild: const SizedBox(height: 25),
                    ),
                    AppTextFormField(
                      title: Strings.current.your_email,
                      key: model.emailKey,
                      hintText: 'youremail@mail.com',
                      controller: model.emailController,
                      validator: model.autoValidateEmail ? model.validateEmail : null,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      autovalidate: model.autoValidateEmail,
                      onChanged: model.onChanged,
                      onCleared: () => model.onChanged(null),
                    ),
                    if (model.hasError) ...[
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            AppIcons.error,
                            size: 12,
                            color: AppColors.error,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            model.modelError,
                            style: [
                              AppStylesSmall.body3Regular,
                              AppStylesBig.body3Regular
                            ].byHeight.copyWith(color: AppColors.error),
                          )
                        ],
                      ),
                    ]
                  ],
                ),
                footer: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      onPressed: model.allowSignIn ? model.send : null,
                      text: Strings.current.receive_code,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            LoadingOverlay(isBusy: model.isBusy),
          ],
        );
      },
    );
  }
}

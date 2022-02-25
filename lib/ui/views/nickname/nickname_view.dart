import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/text_form_field.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'nickname_viewmodel.dart';

class NicknameRouteDependency {
  NicknameRouteDependency({
    this.email,
    this.password,
    this.authResponse,
  });
  final String email;
  final String password;
  final Response authResponse;
}

class NicknameRoute extends MaterialPageRoute {
  NicknameRoute({NicknameRouteDependency dependency})
      : super(
          builder: (context) => Provider.value(
            value: dependency,
            child: NicknameView(),
          ),
          settings: const RouteSettings(name: 'nickname'),
        );
}

class NicknameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NicknameViewModel>.reactive(
      viewModelBuilder: () => NicknameViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: Strings.current.make_up_nickname,
          waiting: model.isBusy,
          expandedAppBarHeight: 96,
          contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
          onBackButton: () => Navigator.pop(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (MediaQuery.of(context).viewInsets.bottom == 0) ...[
                const SizedBox(height: 43),
                Text(
                  Strings.current.success_do_last_step,
                  style: [AppStylesSmall.body1Regular, AppStylesBig.body1Regular]
                      .byHeight
                      .copyWith(color: AppColors.grey87),
                ),
              ],
              const SizedBox(height: 18),
              Form(
                key: model.nicknameFormKey,
                child: AppTextFormField(
                  validator: (value) {
                    final res = model.nickValidator(value);
                    return res;
                  },
                  title: Strings.current.nickname,
                  controller: model.nicknameController,
                  focusNode: model.nicknameFocusNode,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: model.done,
                  inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                ),
              ),
            ],
          ),
          footer: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Checkbox(
                      onChanged: model.iAgreeChange,
                      value: model.iAgree,

                      // additionalConstraints: const BoxConstraints(
                      //     maxHeight: 24, minHeight: 24, minWidth: 30, maxWidth: 30),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: model.toPolitics,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: Strings.current.i_agree_with,
                                style: [
                                  AppStylesSmall.body3Regular,
                                  AppStylesBig.body3Regular
                                ].byHeight.copyWith(color: AppColors.grey87)),
                            TextSpan(
                              text: '\n${Strings.current.private_policy}',
                              style: [
                                AppStylesSmall.body3Regular,
                                AppStylesBig.body3Regular
                              ].byHeight.copyWith(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                AppButton(
                  onPressed: model.isNextButtonEnabled ? model.done : null,
                  text: Strings.current.do_registration,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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

import 'report_problem_viewmodel.dart';

class ReportProblemRoute extends MaterialPageRoute {
  ReportProblemRoute()
      : super(
          builder: (context) => _ReportProblemView(),
          settings: const RouteSettings(name: 'reportProblem'),
        );
}

class _ReportProblemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportProblemViewModel>.reactive(
      viewModelBuilder: () => ReportProblemViewModel(context),
      builder: (context, model, child) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AppScaffold(
                title: Strings.current.report_problem,
                contentPadding: [AppPaddings.h25, AppPaddings.h30].byHeight,
                expandedAppBarHeight: 96,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedCrossFade(
                      duration: 200.milliseconds,
                      crossFadeState: MediaQuery.of(context).viewInsets.bottom < 50
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 53),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: Strings.current.report_problem_tryed,
                                style: [
                                  AppStylesSmall.body1Regular,
                                  AppStylesBig.body1Regular,
                                ].byHeight.copyWith(color: AppColors.greyB8),
                              ),
                              TextSpan(
                                text: Strings.current.report_problem_email_access,
                                style: [
                                  AppStylesSmall.body1Regular,
                                  AppStylesBig.body1Regular,
                                ].byHeight,
                              ),
                              TextSpan(
                                text: Strings.current.report_problem_response,
                                style: [
                                  AppStylesSmall.body1Regular,
                                  AppStylesBig.body1Regular,
                                ].byHeight.copyWith(color: AppColors.greyB8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      secondChild: const SizedBox(height: 25),
                    ),
                    AppTextFormField(
                      title: Strings.current.your_email,
                      key: model.emailKey,
                      hintText: 'youremail@mail.com',
                      scrollPadding: const EdgeInsets.only(top: 20, bottom: 235),
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
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
                footer: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      onPressed: model.allowSignIn ? model.send : null,
                      text: Strings.current.send,
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

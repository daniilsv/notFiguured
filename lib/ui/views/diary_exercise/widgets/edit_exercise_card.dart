import 'package:notfiguured/app/breakpoints.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditExerciseCard extends StatelessWidget {
  const EditExerciseCard({
    @required this.controller,
    @required this.exercise,
    this.userWeight,
  });

  final TextEditingController controller;
  final DiaryDayExercise exercise;
  final double userWeight;

  bool get hasError =>
      controller.text.isNotEmpty && (double.tryParse(controller.text) ?? 0) <= 0;

  @override
  Widget build(BuildContext context) {
    final multiplicator = (double.tryParse(controller.text) ?? 0).clamp(0.0, 9999);
    final hintStyle = [AppStylesSmall.body3Medium, AppStylesBig.body3Medium].byHeight;
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: AppBorderRadius.smallCard,
        color: AppColors.white,
        boxShadow: [AppShadows.easy],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: [29.0, 34.0].byHeight,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Длительность:',
                    style: [
                      AppStylesBig.button1SemiBold,
                      AppStylesSmall.button1SemiBold,
                    ].byHeight.copyWith(color: AppColors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      width: 90,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: AppColors.greyED,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 50),
                              child: TextField(
                                controller: controller,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                scrollPadding:
                                    const EdgeInsets.only(top: 20, bottom: 235),
                                decoration: const InputDecoration.collapsed(
                                  hintText: '',
                                ),
                                buildCounter: (
                                  context, {
                                  currentLength,
                                  isFocused,
                                  maxLength,
                                }) =>
                                    Container(),
                                style: [
                                  AppStylesSmall.button1SemiBold,
                                  AppStylesBig.button1SemiBold,
                                ].byHeight.copyWith(
                                      color: hasError ? AppColors.error : AppColors.black,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                'мин',
                                style: [
                                  AppStylesSmall.button1SemiBold,
                                  AppStylesBig.button1SemiBold,
                                ].byHeight.copyWith(
                                    color: hasError ? AppColors.error : AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.greyDC, thickness: 1, height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Вы сожгли:',
                    style: hintStyle,
                  ),
                  Text(
                    Utils.getKaloriesStr(
                        exercise.calories * multiplicator / 60 * (userWeight ?? 1)),
                    style: hintStyle.copyWith(color: AppColors.green),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

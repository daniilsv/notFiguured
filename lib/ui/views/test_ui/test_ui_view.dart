import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/glass_filter.dart';
import 'package:notfiguured/ui/widgets/goal_card/goal_calories_card.dart';
import 'package:notfiguured/ui/widgets/goal_card/goal_macronutrition_card.dart';
import 'package:notfiguured/ui/widgets/goal_card/goal_weight_card.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/ui/widgets/switch.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../theme/theme.dart';
import '../../widgets/text_form_field.dart';
import 'test_ui_viewmodel.dart';

class TestUIView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TestUIViewModel>.reactive(
      viewModelBuilder: () => TestUIViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return AppScaffold(
          title: 'TestUI',
          backgroundColor: AppColors.greyF3,
          contentPadding: EdgeInsets.zero,
          body: Column(
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Text('Слайдер'),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: PageView(
                  controller: PageController(viewportFraction: 0.9),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GoalWeightCard(
                        index: 1,
                        current: 60,
                        target: TargetWeightModel(startWeight: 60, endWeight: 75),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GoalCaloriesCard(
                        index: 2,
                        current: 70,
                        target: TargetCalorieModel(calories: 65),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GoalMacronutritionCard(
                        index: 3,
                        currentP: 160,
                        currentF: 0,
                        currentC: 80,
                        target: TargetMacroModel(protein: 120, fat: 180, carbon: 160),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const Text('НЕ Слайдер'),
              const SizedBox(height: 20),
              Padding(
                padding: AppPaddings.h25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GoalWeightCard(
                      index: 1,
                      current: 65,
                      target: TargetWeightModel(startWeight: 60, endWeight: 75),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    GoalCaloriesCard(
                      index: 2,
                      current: 60,
                      target: TargetCalorieModel(calories: 65),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    GoalMacronutritionCard(
                      index: 3,
                      currentP: 30,
                      currentF: 80,
                      currentC: 120,
                      target: TargetMacroModel(protein: 120, fat: 180, carbon: 160),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    AppButton(onPressed: model.logout, text: 'Выйти'),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          AppTextFormField(
                            hintText: 'test',
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                AppTextFormField(
                                  title: "title",
                                  progressCounter: 8,
                                  validator: (val) {
                                    return "не прошла валидация";
                                  },
                                ),
                                const SizedBox(height: 10),
                                OutlineButton(
                                  onPressed: () {
                                    formKey.currentState.validate();
                                  },
                                  child: const Text('валидировать'),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text("Shadows"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: AppBorderRadius.button,
                                  boxShadow: [AppShadows.easy],
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: AppBorderRadius.button,
                                  boxShadow: [AppShadows.medium],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text("Overlays"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: AppColors.overlayEasy,
                                  borderRadius: AppBorderRadius.button,
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: AppColors.overlayMedium,
                                  borderRadius: AppBorderRadius.button,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text("Glass Mute Effect"),
                          ),
                          Stack(
                            children: [
                              Align(
                                widthFactor: 4,
                                child: Container(
                                  width: 60,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: AppColors.error,
                                    borderRadius: AppBorderRadius.button,
                                  ),
                                ),
                              ),
                              Align(
                                child: GlassFilter(
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: AppBorderRadius.button,
                                      color: AppColors.greyDC.withOpacity(0.6),
                                    ),
                                    child: const Center(
                                      child: Text('child'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    AppButton(onPressed: () {}, text: 'button'),
                    const SizedBox(height: 20),
                    AppButton(onPressed: () {}, text: 'button'),
                    const SizedBox(height: 20),
                    const AppButton(onPressed: null, text: 'button'),
                    const SizedBox(height: 20),
                    const Divider(),
                    AppSwitch(value: model.switchValue, onChanged: model.toggleSwitch),
                    const SizedBox(height: 20),
                    Checkbox(value: model.switchValue, onChanged: model.toggleSwitch),
                    const SizedBox(height: 20),
                    const Divider(),
                    ...Gender.values
                        .map(
                          (e) => GestureDetector(
                            onTap: () => model.selectGender(e),
                            child: Row(
                              children: [
                                Radio(
                                  value: e,
                                  groupValue: model.selectedGender,
                                  onChanged: model.selectGender,
                                ),
                                Text(e.nameRU()),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    const SizedBox(height: 20),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

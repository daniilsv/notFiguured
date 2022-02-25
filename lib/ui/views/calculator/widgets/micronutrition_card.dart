import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/utils/utils.dart';
import 'package:chopper_api/api/swagger_api.swagger.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';

class MicronutritionCard extends StatelessWidget {
  const MicronutritionCard({
    @required this.category,
    @required this.microCategoryModel,
    Key key,
  }) : super(key: key);

  final String category;
  final MicroCategoryModel microCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: [
            AppPaddings.h25,
            AppPaddings.h30,
          ].byHeight +
          const EdgeInsets.only(bottom: 15),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: AppBorderRadius.card,
          color: AppColors.card,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: [
                  AppStylesSmall.headline2Bold,
                  AppStylesBig.headline2Bold,
                ].byHeight,
              ),
              if (microCategoryModel.name?.isNotEmpty ?? false)
                Text(
                  microCategoryModel.name,
                  style: [
                    AppStylesSmall.headline2Regular,
                    AppStylesBig.headline2Regular,
                  ].byHeight,
                ),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 20),
              ...List.generate(
                microCategoryModel.subcategoryData.length,
                (index) {
                  final MicroDataModel microDataModel =
                      microCategoryModel.subcategoryData[index];
                  final data = microDataModel.data;
                  final microDataName = microDataModel.name;
                  String dataString = '';
                  if (data.min != null) dataString += Utils.numToFixStr(data.min);
                  if (data.min != null && data.max != null) dataString += ' - ';
                  if (data.max != null) dataString += Utils.numToFixStr(data.max);
                  if (data.size != null) dataString += ' ${data.size}';
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$microDataName:',
                        style: [
                          AppStylesSmall.body2Regular,
                          AppStylesBig.body2Regular,
                        ].byHeight.copyWith(color: AppColors.grey87),
                      ),
                      Text(
                        dataString,
                        style: [
                          AppStylesSmall.body2SemiBold,
                          AppStylesBig.body2SemiBold,
                        ].byHeight.copyWith(color: AppColors.black),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

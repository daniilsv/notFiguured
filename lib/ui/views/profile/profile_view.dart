import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/views/debug_menu/debug_menu_view.dart';
import 'package:notfiguured/ui/views/profile/profile_viewmodel.dart';
import 'package:notfiguured/ui/views/profile/widget/profile_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(context),
      builder: (context, model, child) {
        return Container(
          color: AppColors.white,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0.0,
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.white,
                expandedHeight: 111,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),
                  centerTitle: false,
                  title: Text(
                    Strings.current.myProfile,
                    softWrap: true,
                    style: AppStylesBig.headline2Bold,
                  ),
                  background: Container(
                    color: AppColors.greyF3,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildDataBlock(
                      [Fields.nickName],
                      model,
                    ),
                    _buildProfileDivider(),
                    _buildDataBlock(
                      [
                        Fields.dateOfBirs,
                        Fields.sex,
                        Fields.weight,
                        Fields.growth,
                        Fields.activity,
                      ],
                      model,
                    ),
                    _buildProfileDivider(),
                    _buildDataBlock(
                      [Fields.timeLine],
                      model,
                    ),
                    _buildProfileDivider(),
                    _buildExit(model.logout),
                    _buildProfileDivider(),
                    _buildInfo(model),
                    _buildProfileDivider(),
                    _buildCopyright(model.dateCopyright),
                    _buildProfileDivider(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDataBlock(List<Fields> types, ProfileViewModel model) => Column(
          children: types.map((type) {
        if (type != types.last) {
          return Column(
            children: [
              _buildLine(type, model),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(height: 1),
              ),
            ],
          );
        }
        return _buildLine(type, model);
      }).toList());

  Widget _buildLine(
    Fields type,
    ProfileViewModel model,
  ) =>
      ProfileLine(
        name: type.value,
        value: model[type],
        callback: model.callbacks[type],
        isActive: !model.blocked.contains(type),
        textStyleName: [
          AppStylesSmall.body3Medium,
          AppStylesBig.body3Medium,
        ].byHeight,
      );

  Widget _buildProfileDivider() => Column(
        children: [
          const Divider(
            height: 1,
            color: AppColors.greyDC,
          ),
          Container(
            color: AppColors.greyF3,
            height: 50,
          ),
          const Divider(
            color: AppColors.greyDC,
            height: 1,
          ),
        ],
      );

  Widget _buildExit(VoidCallback callback) => ProfileLine(
        name: Fields.exit.value,
        value: emptyString,
        textStyleName: [
          AppStylesSmall.body3MediumRed,
          AppStylesBig.body3MediumRed,
        ].byHeight,
        callback: callback,
      );

  Widget _buildInfo(ProfileViewModel model) => Column(
        children: [
          ProfileLine(
            name: Fields.politics.value,
            value: emptyString,
            textStyleName: AppStylesSmall.body3Medium.copyWith(
              color: AppColors.grey87,
            ),
            callback: model.callbacks[Fields.politics],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(height: 1),
          ),
          ProfileLine(
            name: Fields.about.value,
            value: model[Fields.about],
            textStyleName: [
              AppStylesSmall.body3Medium,
              AppStylesBig.body3Medium,
            ].byHeight.copyWith(
                  color: AppColors.grey87,
                ),
          ),
          if (kDebugMode)
            ProfileLine(
              name: "Debug menu",
              value: "---",
              callback: () => model.navigator.push(DebugMenuRoute()),
              textStyleName: [
                AppStylesSmall.body3Medium,
                AppStylesBig.body3Medium,
              ].byHeight.copyWith(
                    color: AppColors.blue,
                  ),
            ),
        ],
      );

  Widget _buildCopyright(String yearRange) => DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.greyF3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© notfiguured',
                textAlign: TextAlign.end,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: [
                  AppStylesSmall.body3Regular,
                  AppStylesBig.body3Regular,
                ].byHeight.copyWith(color: AppColors.greyB8),
              ),
              Text(
                yearRange,
                textAlign: TextAlign.end,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: [
                  AppStylesSmall.body3Regular,
                  AppStylesBig.body3Regular,
                ].byHeight.copyWith(color: AppColors.greyB8),
              ),
            ],
          ),
        ),
      );
}

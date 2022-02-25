import 'package:notfiguured/l10n/generated/l10n.dart';
import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/button.dart';
import 'package:notfiguured/ui/widgets/loading.dart';
import 'package:notfiguured/ui/widgets/scaffold.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'politics_viewmodel.dart';

class PoliticsRouteDependency {
  PoliticsRouteDependency({
    this.withAccept = true,
  });
  final bool withAccept;
}

class PoliticsRoute extends MaterialPageRoute<bool> {
  PoliticsRoute(PoliticsRouteDependency dependency)
      : super(
          builder: (context) => Provider.value(
            value: dependency,
            child: PoliticsView(),
          ),
          settings: const RouteSettings(name: 'politics'),
        );
}

class PoliticsView extends StatelessWidget {
  final SizedBox titleSpacer = const SizedBox(height: 30);
  final SizedBox subtitleSpacer = const SizedBox(height: 30);
  final Widget divider = const Padding(
    padding: EdgeInsets.symmetric(vertical: 35),
    child: Divider(color: AppColors.greyDC),
  );
  final titleStyle = [AppStylesSmall.headline1Bold, AppStylesBig.headline1Bold].byHeight;
  final subtitleStyle =
      [AppStylesSmall.headline2Bold, AppStylesBig.headline2Bold].byHeight;
  final contentStyle = [AppStylesSmall.body2Regular, AppStylesBig.body2Regular].byHeight;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PoliticsViewModel>.reactive(
      onModelReady: (model) => model.onReady(),
      viewModelBuilder: () => PoliticsViewModel(context),
      builder: (context, model, child) {
        return AppScaffold(
          title: "",
          body: model.isBusy
              ? Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 200 / 258,
                        child: Material(
                          elevation: 1,
                          child: LoadingOverlay(isBusy: model.isBusy),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    AspectRatio(
                        aspectRatio: 200 / 258,
                        child: Material(
                          elevation: 1,
                          child: LoadingOverlay(isBusy: model.isBusy),
                        )),
                  ],
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return PhotoView.customChild(
                      tightMode: true,
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.contained * 2.5,
                      initialScale: PhotoViewComputedScale.contained,
                      backgroundDecoration: const BoxDecoration(color: Colors.white),
                      childSize: const Size(200, 258),
                      child: Material(
                          elevation: 1,
                          child: Image(image: MemoryImage(model.politicsPages[index]))),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: model.politicsPages.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
          footer: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: AppButton(
              onPressed: model.done,
              text: model.needAccept
                  ? Strings.current.accept_and_close
                  : Strings.current.close,
            ),
          ),
        );
      },
    );
  }
}

import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/dot_indicator.dart';
import 'package:flutter/cupertino.dart';

class AppCarouselView extends StatefulWidget {
  const AppCarouselView({
    @required this.children,
    this.onPageChanged,
    this.pageHeight = 300,
    Key key,
  }) : super(key: key);

  final List<Widget> children;
  final Function onPageChanged;
  final double pageHeight;
  @override
  _AppCarouselViewState createState() => _AppCarouselViewState();
}

class _AppCarouselViewState extends State<AppCarouselView> {
  PageController pageController;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  void onPageSelected(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    final int pagesCount = widget.children.length;
    return Column(
      children: [
        SizedBox(
          height: widget.pageHeight,
          child: PageView(
            controller: pageController,
            physics: pagesCount > 1 ? null : const NeverScrollableScrollPhysics(),
            onPageChanged: widget.onPageChanged,
            children: widget.children
                .map(
                  (child) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: child,
                  ),
                )
                .toList(),
          ),
        ),
        if (pagesCount > 1)
          DotsIndicator(
            itemCount: pagesCount,
            controller: pageController,
            onPageSelected: onPageSelected,
            inactiveColor: AppColors.greyB8,
            activeColor: AppColors.primary,
          ),
      ],
    );
  }
}

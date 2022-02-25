import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/app/breakpoints.dart';
import 'package:flutter/cupertino.dart';

class AppTabBar extends StatefulWidget {
  final List<String> tabs;
  final int currentIndex;
  final Function(int) onTabChange;

  const AppTabBar({
    @required this.tabs,
    this.currentIndex = 0,
    this.onTabChange,
    Key key,
  })  : assert(tabs.length < 5),
        super(key: key);

  @override
  _AppTabBarState createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: const BoxDecoration(
        color: AppColors.greyF3,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final widthOfTabItem = constraints.maxWidth / widget.tabs.length;
            return Stack(
              fit: StackFit.expand,
              children: [
                AnimatedPositioned(
                  left: widthOfTabItem * widget.currentIndex,
                  top: 0.0,
                  height: constraints.maxHeight,
                  width: widthOfTabItem,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < widget.tabs.length; i++)
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => widget.onTabChange(i),
                          child: SizedBox(
                            height: constraints.maxHeight,
                            width: widthOfTabItem,
                            child: Center(
                              child: Text(
                                widget.tabs[i],
                                style: i == widget.currentIndex
                                    ? [
                                        AppStylesSmall.body3Medium,
                                        AppStylesBig.body3Medium,
                                      ].byHeight
                                    : [
                                        AppStylesSmall.body3Regular,
                                        AppStylesBig.body3Regular,
                                      ].byHeight.copyWith(color: AppColors.grey87),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

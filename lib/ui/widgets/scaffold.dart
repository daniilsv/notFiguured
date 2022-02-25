import 'package:notfiguured/ui/theme/theme.dart';
import 'package:notfiguured/ui/widgets/app_bar_flexible.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'loading.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    @required this.body,
    this.stickyHeader,
    this.footer,
    this.title,
    this.appBarAction,
    Key key,
    this.onWillPop,
    this.onRefresh,
    this.contentPadding = AppPaddings.h25,
    this.automaticallyImplyLeading = true,
    this.actionBackButtonBaseline = false,
    this.expandedAppBarHeight = 100,
    this.onBackButton,
    this.withUnfocusOnTap = true,
    this.waiting = false,
    this.backgroundColor = AppColors.white,
  }) : super(key: key);

  final Widget stickyHeader;
  final Widget body;
  final Widget footer;
  final Widget appBarAction;
  final String title;
  final bool automaticallyImplyLeading;
  final bool actionBackButtonBaseline;
  final Future<bool> Function() onWillPop;
  final Future Function() onRefresh;
  final Function onBackButton;
  final bool withUnfocusOnTap;
  final EdgeInsets contentPadding;
  final double expandedAppBarHeight;
  final bool waiting;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final SliverAppBar navBar = SliverAppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      flexibleSpace: AppBarFlexible(
        title: title,
        action: appBarAction,
        showAction: MediaQuery.of(context).viewInsets.bottom == 0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        onBackButton: onBackButton,
        actionBackButtonBaseline: actionBackButtonBaseline,
      ),
      expandedHeight: expandedAppBarHeight,
    );
    final sliverBody = SliverPadding(
      padding: contentPadding,
      sliver: SliverToBoxAdapter(
        child: body,
      ),
    );
    final scrollView = CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            if (title != null) navBar,
            if (onRefresh != null) CupertinoSliverRefreshControl(onRefresh: onRefresh),
            if (stickyHeader != null)
              SliverStickyHeader(
                header: stickyHeader,
                sliver: sliverBody,
              )
            else
              sliverBody,
            if (footer != null)
              SliverPadding(
                padding: contentPadding,
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: footer,
                ),
              ),
          ],
        ),
      ),
    );
    return WillPopScope(
      onWillPop: onWillPop ?? () => Future.value(true),
      child: GestureDetector(
        onTap: withUnfocusOnTap ? () => FocusScope.of(context).unfocus() : () {},
        child: Material(
          child: Stack(
            children: [
              scrollView,
              LoadingOverlay(isBusy: waiting),
            ],
          ),
        ),
      ),
    );
  }
}

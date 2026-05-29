import 'package:flutter/material.dart';

class SliverDelegate extends SliverPersistentHeaderDelegate {
  SliverDelegate({
    required this.child,
    required this.selectedIndex,
    this.minimumExtent = 50,
    this.maximumExtent = 50,
    this.backgroundColor,
  });

  final Widget child;
  final int selectedIndex;
  final Color? backgroundColor;
  final double minimumExtent;
  final double maximumExtent;

  @override
  double get minExtent => minimumExtent; // The minimum height of the header
  @override
  double get maxExtent => maximumExtent; // The maximum height of the header

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverDelegate oldDelegate) {
    return selectedIndex != oldDelegate.selectedIndex ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  SliverTabBarDelegate({required this.tabBar});
  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

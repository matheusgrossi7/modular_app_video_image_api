import 'package:flutter/material.dart';
import 'exports.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.scrollController,
    required this.animationDuration,
    required this.curve,
  });
  final ScrollController scrollController;
  final Duration animationDuration;
  final Curve curve;
  final double expandedHeight = 64;

  void _scrollAnimateToTop() {
    if (scrollController.offset != scrollController.initialScrollOffset) {
      scrollController.animateTo(
        scrollController.initialScrollOffset,
        duration: animationDuration,
        curve: curve,
      );
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double _disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Opacity(
        opacity: _disappear(shrinkOffset),
        child: AnimatedContainer(
          duration: animationDuration,
          curve: curve,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
            boxShadow:
                scrollController.offset == scrollController.initialScrollOffset
                    ? []
                    : kElevationToShadow[6],
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Icon(
                Icons.search,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              const SizedBox(width: 16),
              SearchBarTextField(
                scrollAnimateToTop: _scrollAnimateToTop,
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

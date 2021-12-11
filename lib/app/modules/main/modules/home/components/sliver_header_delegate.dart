import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.expandedHeight,
    required this.scrollController,
    required this.animationDuration,
    required this.curve,
  });
  final double expandedHeight;
  final ScrollController scrollController;
  final Duration animationDuration;
  final Curve curve;

  void _scrollAnimateToTop() {
    if (scrollController.offset != scrollController.initialScrollOffset) {
      scrollController.animateTo(
        scrollController.initialScrollOffset,
        duration: animationDuration,
        curve: curve,
      );
    }
  }

  void _onTap() {
    _scrollAnimateToTop();
  }

  void _onChanged(String string) {
    _scrollAnimateToTop();
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
              Flexible(
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  onChanged: (String string) => _onChanged(string),
                  onTap: _onTap,
                  decoration: const InputDecoration(
                    hintText: "Pesquisar",
                    border: InputBorder.none,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.filter_list,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
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

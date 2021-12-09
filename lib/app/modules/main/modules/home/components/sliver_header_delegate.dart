import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.expandedHeight,
    required this.animation,
    required this.scrollController,
    required this.animationDuration,
    required this.curve,
  });
  final double expandedHeight;
  final Animation<double> animation;
  final ScrollController scrollController;
  final Duration animationDuration;
  final Curve curve;
  final double _sidePadding = 16.0;
  bool _isTextFieldOnFocus = false;

  void _scrollAnimateToTop() {
    scrollController.animateTo(
      scrollController.initialScrollOffset,
      duration: animationDuration,
      curve: curve,
    );
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

    return Opacity(
      opacity: _disappear(shrinkOffset),
      child: Padding(
        padding: EdgeInsets.fromLTRB(_sidePadding, 16, _sidePadding, 0),
        child: FadeTransition(
          opacity: animation,
          child: AnimatedContainer(
            duration: animationDuration,
            curve: curve,
            decoration: BoxDecoration(
              border: _isTextFieldOnFocus
                  ? Border.all(
                      color: Theme.of(context).dividerColor,
                      style: BorderStyle.solid,
                      width: 1,
                    )
                  : null,
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).cardColor,
              boxShadow: scrollController.offset ==
                          scrollController.initialScrollOffset &&
                      !_isTextFieldOnFocus
                  ? []
                  : kElevationToShadow[6],
            ),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Focus(
                onFocusChange: (bool isOnFocus) =>
                    _isTextFieldOnFocus = isOnFocus,
                child: Row(
                  children: [
                    const SizedBox(width: 4),
                    Icon(
                      Icons.search,
                      color: _isTextFieldOnFocus
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).disabledColor,
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
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
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.filter_list,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
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

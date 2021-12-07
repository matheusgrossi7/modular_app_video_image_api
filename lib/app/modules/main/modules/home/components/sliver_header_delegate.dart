import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const SliverHeaderDelegate({
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

  void _scrollAnimateToTop() {
    scrollController.animateTo(
      scrollController.initialScrollOffset,
      duration: animationDuration,
      curve: curve,
    );
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
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: FadeTransition(
          opacity: animation,
          child: Card(
            elevation: 6,
            margin: EdgeInsets.zero,
            child: SizedBox(
              height: 40,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    onChanged: (String string) => _onChanged(string),
                    onTap: () => _scrollAnimateToTop(),
                    decoration: const InputDecoration(
                      hintText: "Pesquisar",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
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

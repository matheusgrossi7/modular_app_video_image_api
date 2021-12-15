import 'package:flutter/material.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'exports.dart';

class ImagesSliverGridView extends StatelessWidget {
  const ImagesSliverGridView({
    Key? key,
    required this.photos,
    required this.animationDuration,
  }) : super(key: key);
  final List<PhotoModel> photos;
  final Duration animationDuration;
  final double _itemsSpacing = 8.0;
  final int _crossAxisCount = 2;
  final double _gridPadding = 16.0;

  double _getChildrenWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double childrenWidth = (screenWidth -
            (_gridPadding * 2) -
            (_itemsSpacing * (_crossAxisCount - 1))) /
        _crossAxisCount;
    return childrenWidth;
  }

  @override
  Widget build(BuildContext context) {
    if (photos.isNotEmpty) {
      double _childrenWidth = _getChildrenWidth(context);
      return SliverPadding(
        padding: EdgeInsets.all(_gridPadding),
        sliver: SliverStaggeredGrid.count(
          crossAxisCount: _crossAxisCount,
          mainAxisSpacing: _itemsSpacing,
          crossAxisSpacing: _itemsSpacing,
          children: photos
              .map(
                (photo) => ImageGridItem(
                  photo: photo,
                  animationDuration: animationDuration,
                  itemsSpacing: _itemsSpacing,
                  itemWidth: _childrenWidth,
                ),
              )
              .toList(),
          staggeredTiles: photos
              .map(
                (photo) => const StaggeredTile.fit(1),
              )
              .toList(),
        ),
      );
    } else {
      return const NothingFoundSliverPlaceholder();
    }
  }
}

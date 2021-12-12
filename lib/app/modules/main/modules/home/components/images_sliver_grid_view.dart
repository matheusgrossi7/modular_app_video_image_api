import 'package:flutter/material.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'exports.dart';

class ImagesSliverGridView extends StatelessWidget {
  const ImagesSliverGridView({
    Key? key,
    required this.photos,
    required this.animationDuration,
  }) : super(key: key);
  final List<PhotoModel> photos;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: photos
            .map(
              (photo) => ImageGridItem(
                photo: photo,
                animationDuration: animationDuration,
              ),
            )
            .toList(),
      ),
    );
  }
}

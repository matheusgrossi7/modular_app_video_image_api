import 'package:flutter/material.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

class ImageGridItem extends StatelessWidget {
  const ImageGridItem({
    Key? key,
    required this.photo,
    required this.animationDuration,
    required this.itemsSpacing,
    required this.itemWidth,
  }) : super(key: key);
  final PhotoModel photo;
  final Duration animationDuration;
  final double itemsSpacing;
  final double itemWidth;

  Size getItemSize(
      BuildContext context, double mediaWidth, double mediaHeight) {
    Size size = Size(itemWidth, itemWidth * mediaHeight / mediaWidth);
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
        getItemSize(
          context,
          photo.width,
          photo.height,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Container(
              color: Color(photo.avgHexColor),
            ),
            FadeInImage.assetNetwork(
              image: photo.urlMediumSize,
              width: double.maxFinite,
              height: double.maxFinite,
              key: UniqueKey(),
              fit: BoxFit.cover,
              fadeInDuration: animationDuration,
              fadeOutDuration: animationDuration,
              placeholder: "assets/images/transparent.png",
            ),
          ],
        ),
      ),
    );
  }
}

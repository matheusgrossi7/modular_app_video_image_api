import 'package:flutter/material.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

class ImageGridItem extends StatelessWidget {
  const ImageGridItem({
    Key? key,
    required this.photo,
    required this.animationDuration,
  }) : super(key: key);
  final PhotoModel photo;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}

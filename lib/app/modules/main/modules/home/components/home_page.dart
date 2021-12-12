import 'package:flutter/material.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.photos,
    required this.fadeInAnimationDuration,
    required this.scrollController,
    required this.curve,
    required this.fadeInAnimation,
    required this.tweenScaleUp,
  }) : super(key: key);
  final List<PhotoModel> photos;
  final Animation<double> fadeInAnimation;
  final ScrollController scrollController;
  final Duration fadeInAnimationDuration;
  final Curve curve;
  final Tween<double> tweenScaleUp;

  @override
  Widget build(BuildContext context) {
    return FadeScaleTransition(
      fadeInAnimation: fadeInAnimation,
      fadeInAnimationDuration: fadeInAnimationDuration,
      tweenScaleUp: tweenScaleUp,
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(
            key: UniqueKey(),
            floating: true,
            delegate: SliverHeaderDelegate(
              scrollController: scrollController,
              animationDuration: fadeInAnimationDuration,
              curve: curve,
            ),
          ),
          ImagesSliverGridView(
            key: UniqueKey(),
            animationDuration: fadeInAnimationDuration,
            photos: photos,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../exports.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    required this.fadeInAnimation,
    required this.fadeInAnimationDuration,
    required this.tweenScaleUp,
  }) : super(key: key);
  final Animation<double> fadeInAnimation;
  final Duration fadeInAnimationDuration;
  final Tween<double> tweenScaleUp;

  @override
  Widget build(BuildContext context) {
    return FadeScaleTransition(
      fadeInAnimation: fadeInAnimation,
      fadeInAnimationDuration: fadeInAnimationDuration,
      tweenScaleUp: tweenScaleUp,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FadeScaleTransition extends StatelessWidget {
  const FadeScaleTransition({
    Key? key,
    required this.fadeInAnimation,
    required this.tweenScaleUp,
    required this.fadeInAnimationDuration,
    required this.child,
  }) : super(key: key);
  final Animation<double> fadeInAnimation;
  final Tween<double> tweenScaleUp;
  final Duration fadeInAnimationDuration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeInAnimation,
      child: TweenAnimationBuilder(
        tween: tweenScaleUp,
        duration: fadeInAnimationDuration,
        builder: (BuildContext context, double scale, Widget? child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

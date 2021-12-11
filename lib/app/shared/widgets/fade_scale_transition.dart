import 'package:flutter/material.dart';

class FadeScaleTransition extends StatefulWidget {
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
  State<FadeScaleTransition> createState() => _FadeScaleTransitionState();
}

class _FadeScaleTransitionState extends State<FadeScaleTransition>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.fadeInAnimation,
      child: TweenAnimationBuilder(
        tween: widget.tweenScaleUp,
        duration: widget.fadeInAnimationDuration,
        builder: (BuildContext context, double scale, Widget? child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FadeScaleTransition extends StatefulWidget {
  const FadeScaleTransition({
    Key? key,
    required this.animation,
    required this.tweenScale,
    required this.tweenDuration,
    required this.child,
  }) : super(key: key);
  final Animation<double> animation;
  final Tween<double> tweenScale;
  final Duration tweenDuration;
  final Widget child;

  @override
  State<FadeScaleTransition> createState() => _FadeScaleTransitionState();
}

class _FadeScaleTransitionState extends State<FadeScaleTransition>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: TweenAnimationBuilder(
        tween: widget.tweenScale,
        duration: widget.tweenDuration,
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

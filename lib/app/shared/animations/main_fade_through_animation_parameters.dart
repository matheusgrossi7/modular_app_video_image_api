import 'package:flutter/material.dart';

import 'animations_parameters_interface.dart';

class MainFadeThroughAnimationParameters extends AnimationsParametersI {
  @override
  Duration get duration => const Duration(milliseconds: 300);

  @override
  Duration get fadeInDuration => const Duration(milliseconds: 210);

  @override
  Duration get fadeOutDuration => const Duration(milliseconds: 90);

  @override
  Tween<double> get tweenFadeOut => Tween<double>(begin: 1, end: 0);

  @override
  Tween<double> get tweenFadeIn => Tween<double>(begin: 0, end: 1);

  @override
  Tween<double> get tweenScaleUp => Tween<double>(begin: 0.92, end: 1);

  @override
  Curve get curve => Curves.easeIn;
}

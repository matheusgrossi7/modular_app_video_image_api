import 'package:flutter/material.dart';

abstract class AnimationsParametersI {
  Duration get fadeInDuration;
  Duration get fadeOutDuration;
  Duration get duration;
  Curve get curve;
  Tween<double> get tweenFadeOut;
  Tween<double> get tweenFadeIn;
  Tween<double> get tweenScaleUp;
}

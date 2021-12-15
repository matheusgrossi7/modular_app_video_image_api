import 'package:flutter/animation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'main_molule.dart';

part 'main_controller.g.dart';

class MainController = _MainController with _$MainController;

abstract class _MainController with Store {
  AnimationsParametersI animationsParameters;

  bool _isAnimationConcluded = true;

  @observable
  int currentPageIndex = 0;

  @observable
  int currentBottomNavIndex = 0;

  @action
  Future<void> changeCurrentPageIndex({
    required int newIndex,
    required AnimationController fadeOutAnimationController,
  }) async {
    Duration _fadeOutAnimationDuration = animationsParameters.fadeOutDuration;
    Duration _animationDuration = animationsParameters.duration;
    if (newIndex != currentBottomNavIndex && _isAnimationConcluded) {
      _isAnimationConcluded = false;
      fadeOutAnimationController.duration = _fadeOutAnimationDuration;
      fadeOutAnimationController.forward();
      currentBottomNavIndex = newIndex;
      await Future.delayed(_fadeOutAnimationDuration);
      currentPageIndex = newIndex;
      switch (currentPageIndex) {
        case 0:
          Modular.to.navigate(MainModule.imagesModuleRouteName);
          break;
        case 1:
          Modular.to.navigate(MainModule.favoritesModuleRouteName);
          break;
        default:
          Modular.to.navigate(MainModule.imagesModuleRouteName);
          break;
      }
      fadeOutAnimationController.duration = const Duration(milliseconds: 0);
      fadeOutAnimationController.reverse();
      await Future.delayed(_animationDuration);
      await Future.delayed(_fadeOutAnimationDuration);
      _isAnimationConcluded = true;
    }
  }

  _MainController(this.animationsParameters) {
    Modular.to.navigate(MainModule.imagesModuleRouteName);
  }
}

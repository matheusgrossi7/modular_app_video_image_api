import 'package:flutter/animation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/main_molule.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

part 'main_controller.g.dart';

class MainController = _MainController with _$MainController;

abstract class _MainController with Store {
  _MainController(this.animationsParameters);
  AnimationsParametersI animationsParameters;

  @observable
  int currentPageIndex = 0;

  @observable
  int currentBottomNavIndex = 0;

  @observable
  bool isAnimationConcluded = true;

  @action
  setIsAnimationConcluded(bool value) {
    isAnimationConcluded = value;
  }

  void init() {
    Modular.to.navigate(MainModule.homePageRouteName);
  }

  Future<void> changeCurrentPageIndex({
    required int newIndex,
    required AnimationController fadeOutAnimationController,
  }) async {
    Duration _fadeOutAnimationDuration = animationsParameters.fadeOutDuration;
    Duration _animationDuration = animationsParameters.duration;
    if (newIndex != currentBottomNavIndex && isAnimationConcluded) {
      isAnimationConcluded = false;
      fadeOutAnimationController.duration = _fadeOutAnimationDuration;
      fadeOutAnimationController.forward();
      currentBottomNavIndex = newIndex;
      await Future.delayed(_fadeOutAnimationDuration);
      currentPageIndex = newIndex;
      switch (currentPageIndex) {
        case 0:
          Modular.to.navigate(MainModule.homePageRouteName);
          break;
        case 1:
          Modular.to.navigate(MainModule.favoritesPageRouteName);
          break;
        default:
          Modular.to.navigate(MainModule.homePageRouteName);
          break;
      }
      fadeOutAnimationController.duration = const Duration(milliseconds: 0);
      fadeOutAnimationController.reverse();
      await Future.delayed(_animationDuration);
      await Future.delayed(_fadeOutAnimationDuration);
      isAnimationConcluded = true;
    }
  }
}

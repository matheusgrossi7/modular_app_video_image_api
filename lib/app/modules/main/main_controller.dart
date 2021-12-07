import 'package:flutter/animation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/shared/animations/animations_parameters_interface.dart';

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
    Modular.to.navigate("/home/");
  }

  Future<void> changeCurrentPageIndex({
    required int newIndex,
    required AnimationController fadeOutAnimationController,
  }) async {
    if (newIndex != currentBottomNavIndex && isAnimationConcluded) {
      isAnimationConcluded = false;
      fadeOutAnimationController.duration =
          animationsParameters.fadeOutDuration;
      fadeOutAnimationController.forward();
      currentBottomNavIndex = newIndex;
      await Future.delayed(animationsParameters.fadeOutDuration);
      currentPageIndex = newIndex;
      switch (currentPageIndex) {
        case 0:
          Modular.to.navigate("/home/");
          break;
        case 1:
          Modular.to.navigate("/favorites/");
          break;
        default:
          Modular.to.navigate("/home");
          break;
      }
      fadeOutAnimationController.duration = const Duration(milliseconds: 0);
      fadeOutAnimationController.reverse();
      await Future.delayed(animationsParameters.duration);
      isAnimationConcluded = true;
    }
  }
}

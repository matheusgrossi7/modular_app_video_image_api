import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/shared/animations/animations_parameters.dart';

part 'main_controller.g.dart';

class MainController = _MainController with _$MainController;

abstract class _MainController with Store {
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

  Future<void> changeCurrentPageIndex(int newIndex) async {
    if (newIndex != currentPageIndex) {
      currentBottomNavIndex = newIndex;
      await Future.delayed(AnimationParameters.fadeOutDuration);
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
    }
  }
}

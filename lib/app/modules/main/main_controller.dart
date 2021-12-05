import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'main_controller.g.dart';

class MainController = _MainController with _$MainController;

abstract class _MainController with Store {
  @observable
  int currentPageIndex = 0;

  @observable
  bool isPageTransitionAnimationReversed = false;

  @action
  void init() {
    Modular.to.navigate("/home/");
  }

  @action
  void changeCurrentPageIndex(int newIndex) {
    if (newIndex > currentPageIndex) {
      isPageTransitionAnimationReversed = false;
    } else if (newIndex < currentPageIndex) {
      isPageTransitionAnimationReversed = true;
    }
    if (newIndex != currentPageIndex) {
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

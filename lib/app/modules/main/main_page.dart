import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ModularState<MainPage, MainController>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeOutAnimationController;
  Tween<double>? _tweenFadeOut;
  Animation<double>? _fadeOutAnimation;
  Duration? _fadeOutAnimationDuration;

  @override
  void initState() {
    super.initState();
    _fadeOutAnimationDuration = controller.animationsParameters.fadeOutDuration;
    _fadeOutAnimationController = AnimationController(
      vsync: this,
      duration: _fadeOutAnimationDuration,
    );
    _tweenFadeOut = controller.animationsParameters.tweenFadeOut;
    _fadeOutAnimation = _tweenFadeOut!.animate(_fadeOutAnimationController!);
  }

  @override
  void dispose() {
    _fadeOutAnimationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (BuildContext context) => FadeTransition(
          opacity: _fadeOutAnimation!,
          child: Container(
            key: Key(
              UniqueKey().toString() + controller.currentPageIndex.toString(),
            ),
            child: RouterOutlet(),
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (BuildContext context) => BottomNavigationBar(
          currentIndex: controller.currentBottomNavIndex,
          onTap: (int index) => controller.changeCurrentPageIndex(
            newIndex: index,
            fadeOutAnimationController: _fadeOutAnimationController!,
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              activeIcon: Icon(Icons.image),
              label: "Images",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: "Favoritos",
            ),
          ],
        ),
      ),
    );
  }
}

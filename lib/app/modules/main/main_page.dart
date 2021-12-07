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
    controller.init();
    _fadeOutAnimationController = AnimationController(
      vsync: this,
      duration: _fadeOutAnimationDuration,
    );
    _tweenFadeOut = Tween<double>(begin: 1, end: 0);
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
          child: RouterOutlet(
            key: Key(
              UniqueKey().toString() + controller.currentPageIndex.toString(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (BuildContext context) => BottomNavigationBar(
          currentIndex: controller.currentBottomNavIndex,
          onTap: (int index) async => controller.changeCurrentPageIndex(
            newIndex: index,
            fadeOutAnimationController: _fadeOutAnimationController!,
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
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

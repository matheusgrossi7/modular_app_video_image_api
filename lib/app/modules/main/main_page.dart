import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/shared/animations/animations_parameters.dart';

import 'main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ModularState<MainPage, MainController>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeOutAnimationController;
  Tween<double>? _tweenFade;
  Animation<double>? _fadeOutAnimation;
  final Duration _fadeOutAnimationDuraion = AnimationParameters.fadeOutDuration;

  @override
  void initState() {
    super.initState();
    controller.init();
    _fadeOutAnimationController = AnimationController(
      vsync: this,
      duration: _fadeOutAnimationDuraion,
    );
    _tweenFade = Tween<double>(begin: 1, end: 0);
    _fadeOutAnimation = _tweenFade!.animate(_fadeOutAnimationController!);
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
          onTap: (int index) async {
            if (controller.isAnimationConcluded &&
                index != controller.currentBottomNavIndex) {
              controller.setIsAnimationConcluded(false);
              _fadeOutAnimationController!.duration = _fadeOutAnimationDuraion;
              _fadeOutAnimationController!.forward();
              controller.changeCurrentPageIndex(index);
              await Future.delayed(_fadeOutAnimationDuraion);
              _fadeOutAnimationController!.duration =
                  const Duration(milliseconds: 0);
              _fadeOutAnimationController!.reverse();
              controller.setIsAnimationConcluded(true);
            }
          },
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

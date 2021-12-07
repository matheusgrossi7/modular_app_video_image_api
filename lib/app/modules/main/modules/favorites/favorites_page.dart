import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'favorites_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState
    extends ModularState<FavoritesPage, FavoritesController>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeInAnimationController;
  Animation<double>? _fadeInAnimation;
  Tween<double>? _tweenFade;
  Duration? _fadeInAnimationDuraion;

  @override
  void initState() {
    super.initState();
    _fadeInAnimationDuraion = controller.animationParameters.fadeInDuration;
    _fadeInAnimationController = AnimationController(
      vsync: this,
      duration: _fadeInAnimationDuraion,
    );
    _tweenFade = Tween<double>(begin: 0.5, end: 1);
    _fadeInAnimation = _tweenFade!.animate(_fadeInAnimationController!);
    _fadeInAnimationController!.forward();
  }

  @override
  void dispose() {
    _fadeInAnimationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeInAnimation!,
        child: const Center(
          child: Text("Favorites"),
        ),
      ),
    );
  }
}

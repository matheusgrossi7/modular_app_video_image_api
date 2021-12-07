import 'package:flutter/material.dart';
import 'package:test_modular_app_video_image_api/app/shared/animations/animations_parameters.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeInAnimationController;
  Animation<double>? _fadeInAnimation;
  Tween<double>? _tweenFade;
  final Duration _fadeInAnimationDuraion = AnimationParameters.fadeInDuration;

  @override
  void initState() {
    super.initState();
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

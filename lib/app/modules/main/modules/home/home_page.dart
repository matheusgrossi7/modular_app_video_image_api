import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'components/exports.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeInAnimationController;
  Animation<double>? _fadeInAnimation;
  Tween<double>? _tweenFadeIn;
  Tween<double>? _tweenScaleUp;
  ScrollController? _scrollController;
  Duration? _fadeInAnimationDuraion;
  Duration? _animationDuration;

  @override
  void initState() {
    super.initState();
    _fadeInAnimationDuraion = controller.animationsParameters.fadeInDuration;
    _animationDuration = controller.animationsParameters.duration;
    _scrollController = ScrollController();
    _fadeInAnimationController = AnimationController(
      vsync: this,
      duration: _fadeInAnimationDuraion,
    );
    _tweenScaleUp = controller.animationsParameters.tweenScaleUp;
    _tweenFadeIn = controller.animationsParameters.tweenFadeIn;
    _fadeInAnimation = _tweenFadeIn!.animate(_fadeInAnimationController!);
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
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController!,
          slivers: [
            SliverPersistentHeader(
              key: UniqueKey(),
              floating: true,
              delegate: SliverHeaderDelegate(
                scrollController: _scrollController!,
                animation: _fadeInAnimation!,
                animationDuration: _animationDuration!,
                expandedHeight: 56,
                curve: controller.animationsParameters.curve,
              ),
            ),
            SliverToBoxAdapter(
              key: UniqueKey(),
              child: FadeScaleTransition(
                key: UniqueKey(),
                animation: _fadeInAnimation!,
                tweenScale: _tweenScaleUp!,
                tweenDuration: _fadeInAnimationDuraion!,
                child: ImagesGridView(
                  key: UniqueKey(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

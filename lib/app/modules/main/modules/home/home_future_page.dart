import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/modules/home/home_controller.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'home_module.dart';
import 'utils/enums/exports.dart';
import 'components/exports.dart';

class HomeFuturePage extends StatefulWidget {
  const HomeFuturePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFuturePage> createState() => _HomeFuturePageState();
}

class _HomeFuturePageState extends State<HomeFuturePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeInAnimationController;
  Animation<double>? _fadeInAnimation;
  Tween<double>? _tweenFadeIn;
  Tween<double>? _tweenScaleUp;
  ScrollController? _scrollController;
  Duration? _fadeInAnimationDuration;
  Curve? _curve;
  // Temporary workaround, more info in home_module.dart
  HomeController controller = homeController;

  @override
  void initState() {
    super.initState();
    _fadeInAnimationDuration = controller.animationsParameters.fadeInDuration;
    _curve = controller.animationsParameters.curve;
    _scrollController = ScrollController();
    _fadeInAnimationController = AnimationController(
      vsync: this,
      duration: _fadeInAnimationDuration,
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColorDark,
      ),
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Theme.of(context).primaryColorDark),
      child: Scaffold(
        body: SafeArea(
          child: Observer(
            builder: (BuildContext context) {
              Widget? _widget;
              if (controller.homeStatus == HomeStatus.loading) {
                _widget = LoadingIndicator(
                  fadeInAnimation: _fadeInAnimation!,
                  fadeInAnimationDuration: _fadeInAnimationDuration!,
                  tweenScaleUp: _tweenScaleUp!,
                );
              } else if (controller.homeStatus == HomeStatus.success) {
                _widget = HomePage(
                  scrollController: _scrollController!,
                  fadeInAnimation: _fadeInAnimation!,
                  curve: _curve!,
                  fadeInAnimationDuration: _fadeInAnimationDuration!,
                  tweenScaleUp: _tweenScaleUp!,
                  photos: controller.photos!,
                );
              } else if (controller.homeStatus == HomeStatus.error) {
                _widget = ConnectionErrorPlaceholder(
                  refresh: controller.refresh,
                );
              }
              return _widget!;
            },
          ),
        ),
      ),
    );
  }
}

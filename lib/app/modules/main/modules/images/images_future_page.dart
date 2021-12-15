import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'images_controller.dart';
import 'images_module.dart';
import 'utils/enums/exports.dart';
import 'components/exports.dart';

class ImagesFuturePage extends StatefulWidget {
  const ImagesFuturePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ImagesFuturePage> createState() => _ImagesFuturePageState();
}

class _ImagesFuturePageState extends State<ImagesFuturePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeInAnimationController;
  Animation<double>? _fadeInAnimation;
  Tween<double>? _tweenFadeIn;
  Tween<double>? _tweenScaleUp;
  ScrollController? _scrollController;
  Duration? _fadeInAnimationDuration;
  Curve? _curve;
  // Temporary workaround, more info in images_module.dart
  ImagesController controller = imagesController;

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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Theme.of(context).primaryColorDark),
      child: Scaffold(
        body: SafeArea(
          child: Observer(
            builder: (BuildContext context) {
              Widget? _widget;
              if (controller.imagesStatus == ImagesStatus.loading) {
                _widget = LoadingIndicator(
                  fadeInAnimation: _fadeInAnimation!,
                  fadeInAnimationDuration: _fadeInAnimationDuration!,
                  tweenScaleUp: _tweenScaleUp!,
                );
              } else if (controller.imagesStatus == ImagesStatus.success) {
                _widget = ImagesPage(
                  scrollController: _scrollController!,
                  fadeInAnimation: _fadeInAnimation!,
                  curve: _curve!,
                  fadeInAnimationDuration: _fadeInAnimationDuration!,
                  tweenScaleUp: _tweenScaleUp!,
                  photos: controller.photos!,
                );
              } else if (controller.imagesStatus == ImagesStatus.error) {
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

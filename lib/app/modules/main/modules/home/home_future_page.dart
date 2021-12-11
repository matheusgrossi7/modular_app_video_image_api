import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/models/exports.dart';

import 'components/exports.dart';
import 'home_controller.dart';

class HomeFuturePage extends StatefulWidget {
  const HomeFuturePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFuturePage> createState() => _HomeFuturePageState();
}

class _HomeFuturePageState extends ModularState<HomeFuturePage, HomeController>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeInAnimationController;
  Animation<double>? _fadeInAnimation;
  Tween<double>? _tweenFadeIn;
  Tween<double>? _tweenScaleUp;
  ScrollController? _scrollController;
  Duration? _fadeInAnimationDuration;
  Curve? _curve;
  ObservableFuture<PhotosResponse>? _futurePhotosResponse;

  @override
  void initState() {
    super.initState();
    _futurePhotosResponse = controller.photos;
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
              Widget _widget;
              if (_futurePhotosResponse!.status == FutureStatus.fulfilled) {
                PhotosResponse _photosResponse = _futurePhotosResponse!.value!;
                if (_photosResponse.responseStatusCode == 200) {
                  _widget = HomePage(
                    scrollController: _scrollController!,
                    fadeInAnimation: _fadeInAnimation!,
                    curve: _curve!,
                    fadeInAnimationDuration: _fadeInAnimationDuration!,
                    tweenScaleUp: _tweenScaleUp!,
                    photos: _photosResponse.photos,
                  );
                } else {
                  _widget = const Text("Sem conexão");
                }
              } else {
                _widget = const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return _widget;
            },
          ),
        ),
      ),
    );
  }
}

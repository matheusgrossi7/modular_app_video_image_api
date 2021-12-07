import 'package:flutter/material.dart';
import 'package:test_modular_app_video_image_api/app/shared/animations/animations_parameters.dart';

import 'components/images_grid_view.dart';
import 'components/sliver_header_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeInAnimationController;
  Animation<double>? _fadeInAnimation;
  Tween<double>? _tweenFade;
  Tween<double>? _tweenScale;
  ScrollController? _scrollController;
  final Duration _fadeInAnimationDuraion = AnimationParameters.fadeInDuration;
  final Duration _animationDuration = AnimationParameters.duration;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _fadeInAnimationController = AnimationController(
      vsync: this,
      duration: _fadeInAnimationDuraion,
    );
    _tweenScale = Tween<double>(begin: 0.92, end: 1);
    _tweenFade = Tween<double>(begin: 0, end: 1);
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
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController!,
          slivers: [
            SliverPersistentHeader(
              floating: true,
              delegate: SliverHeaderDelegate(
                scrollController: _scrollController!,
                animation: _fadeInAnimation!,
                animationDuration: _animationDuration,
                expandedHeight: 56,
              ),
            ),
            SliverToBoxAdapter(
              key: UniqueKey(),
              child: ImagesGridView(
                key: UniqueKey(),
                animation: _fadeInAnimation!,
                tweenScale: _tweenScale!,
                tweenDuration: _fadeInAnimationDuraion,
              ),
            )
          ],
        ),
      ),
    );
  }
}

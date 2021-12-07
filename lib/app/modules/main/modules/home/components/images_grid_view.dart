import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';

class ImagesGridView extends StatefulWidget {
  const ImagesGridView({
    Key? key,
    required this.animation,
    required this.tweenScale,
    required this.tweenDuration,
  }) : super(key: key);
  final Animation<double> animation;
  final Tween<double> tweenScale;
  final Duration tweenDuration;

  @override
  State<ImagesGridView> createState() => _ImagesGridViewState();
}

class _ImagesGridViewState extends ModularState<ImagesGridView, HomeController>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => FadeTransition(
        opacity: widget.animation,
        child: TweenAnimationBuilder(
            tween: widget.tweenScale,
            duration: widget.tweenDuration,
            builder: (BuildContext context, double scale, Widget? child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.imagesUrls.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (BuildContext context, int index) => Card(
                margin: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    controller.imagesUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

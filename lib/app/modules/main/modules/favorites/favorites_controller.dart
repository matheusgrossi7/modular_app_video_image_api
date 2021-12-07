import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

abstract class _FavoritesController with Store {
  _FavoritesController(this.animationsParameters);
  final AnimationsParametersI animationsParameters;
}

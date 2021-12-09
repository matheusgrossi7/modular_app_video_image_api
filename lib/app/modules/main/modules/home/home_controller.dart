import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/models/exports.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/repository/exports.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final AnimationsParametersI animationsParameters;
  final MediaRepositoryI mediaRepositoryI;

  @observable
  ObservableFuture<PhotosResponse>? photos;

  @observable
  String search = "view";

  @observable
  int page = 1;

  @observable
  int perPage = 50;

  _HomeController(
    this.animationsParameters,
    this.mediaRepositoryI,
  ) {
    photos = mediaRepositoryI
        .fetchImages(
          search: search,
          perPage: perPage,
          page: page,
        )
        .asObservable();
  }
}

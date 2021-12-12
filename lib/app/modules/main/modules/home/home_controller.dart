import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/repository/exports.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'utils/enums/home_status.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final AnimationsParametersI animationsParameters;
  final MediaRepositoryI mediaRepositoryI;

  void initialSearch() {
    homeStatus = HomeStatus.loading;
    mediaRepositoryI
        .fetchImages(
      perPage: perPage,
      page: page,
    )
        .then(
      (response) {
        if (response.responseStatusCode == 200) {
          homeStatus = HomeStatus.success;
          photos = response.photos;
        } else {
          homeStatus = HomeStatus.error;
        }
      },
    );
  }

  @observable
  String searchFieldInitialValue = "";

  @observable
  int page = 1;

  @observable
  int perPage = 80;

  @observable
  int homeStatus = HomeStatus.loading;

  @observable
  List<PhotoModel>? photos;

  @action
  void setHomeStatus(int newStatus) {
    homeStatus = newStatus;
  }

  @action
  void setSearchFieldInitialValue(String newValue) {
    searchFieldInitialValue = newValue;
  }

  @action
  void refresh() {
    if (searchFieldInitialValue.isNotEmpty) {
      initialSearch();
    } else {
      search(searchFieldInitialValue);
    }
  }

  @action
  Future<void> search(String newSearchLabel) async {
    setHomeStatus(HomeStatus.loading);
    mediaRepositoryI
        .fetchImages(
      search: newSearchLabel,
      perPage: perPage,
      page: page,
    )
        .then(
      (response) {
        if (response.responseStatusCode == 200) {
          photos = response.photos;
          setHomeStatus(HomeStatus.success);
        } else {
          setHomeStatus(HomeStatus.error);
        }
      },
    );
  }

  _HomeController(
    this.animationsParameters,
    this.mediaRepositoryI,
  ) {
    initialSearch();
  }
}

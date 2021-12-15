import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:test_modular_app_video_image_api/app/modules/main/repository/exports.dart';
import 'package:test_modular_app_video_image_api/app/shared/exports.dart';

import 'utils/enums/enum_images_status.dart';

part 'images_controller.g.dart';

class ImagesController = _ImagesController with _$ImagesController;

abstract class _ImagesController with Store {
  final AnimationsParametersI animationsParameters;
  final MediaRepositoryI mediaRepositoryI;

  final FocusNode focusNode = FocusNode();

  void initialSearch() {
    imagesStatus = ImagesStatus.loading;
    mediaRepositoryI
        .fetchImages(
      perPage: perPage,
      page: page,
    )
        .then(
      (response) {
        if (response.responseStatusCode == 200) {
          imagesStatus = ImagesStatus.success;
          photos = response.photos;
        } else {
          imagesStatus = ImagesStatus.error;
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
  int imagesStatus = ImagesStatus.loading;

  @observable
  List<PhotoModel>? photos;

  @action
  void setImagesStatus(int newStatus) {
    imagesStatus = newStatus;
  }

  @action
  void setSearchFieldInitialValue(String newValue) {
    searchFieldInitialValue = newValue;
  }

  @action
  void refresh() {
    if (searchFieldInitialValue.trim().isEmpty) {
      initialSearch();
    } else {
      search(searchFieldInitialValue);
    }
  }

  @action
  Future<void> search(String newSearchLabel) async {
    String _newSearchLabelTrimmed = newSearchLabel.trim();
    if (_newSearchLabelTrimmed.isNotEmpty) {
      setImagesStatus(ImagesStatus.loading);
      setSearchFieldInitialValue(_newSearchLabelTrimmed);
      mediaRepositoryI
          .fetchImages(
        search: _newSearchLabelTrimmed,
        perPage: perPage,
        page: page,
      )
          .then(
        (response) {
          if (response.responseStatusCode == 200) {
            photos = response.photos;
            setImagesStatus(ImagesStatus.success);
          } else {
            setImagesStatus(ImagesStatus.error);
          }
        },
      );
    }
  }

  _ImagesController(
    this.animationsParameters,
    this.mediaRepositoryI,
  ) {
    initialSearch();
  }
}

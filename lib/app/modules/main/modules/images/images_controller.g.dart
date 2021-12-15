// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImagesController on _ImagesController, Store {
  final _$searchFieldInitialValueAtom =
      Atom(name: '_ImagesController.searchFieldInitialValue');

  @override
  String get searchFieldInitialValue {
    _$searchFieldInitialValueAtom.reportRead();
    return super.searchFieldInitialValue;
  }

  @override
  set searchFieldInitialValue(String value) {
    _$searchFieldInitialValueAtom
        .reportWrite(value, super.searchFieldInitialValue, () {
      super.searchFieldInitialValue = value;
    });
  }

  final _$pageAtom = Atom(name: '_ImagesController.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$perPageAtom = Atom(name: '_ImagesController.perPage');

  @override
  int get perPage {
    _$perPageAtom.reportRead();
    return super.perPage;
  }

  @override
  set perPage(int value) {
    _$perPageAtom.reportWrite(value, super.perPage, () {
      super.perPage = value;
    });
  }

  final _$imagesStatusAtom = Atom(name: '_ImagesController.imagesStatus');

  @override
  int get imagesStatus {
    _$imagesStatusAtom.reportRead();
    return super.imagesStatus;
  }

  @override
  set imagesStatus(int value) {
    _$imagesStatusAtom.reportWrite(value, super.imagesStatus, () {
      super.imagesStatus = value;
    });
  }

  final _$photosAtom = Atom(name: '_ImagesController.photos');

  @override
  List<PhotoModel>? get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(List<PhotoModel>? value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_ImagesController.search');

  @override
  Future<void> search(String newSearchLabel) {
    return _$searchAsyncAction.run(() => super.search(newSearchLabel));
  }

  final _$_ImagesControllerActionController =
      ActionController(name: '_ImagesController');

  @override
  void setImagesStatus(int newStatus) {
    final _$actionInfo = _$_ImagesControllerActionController.startAction(
        name: '_ImagesController.setImagesStatus');
    try {
      return super.setImagesStatus(newStatus);
    } finally {
      _$_ImagesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchFieldInitialValue(String newValue) {
    final _$actionInfo = _$_ImagesControllerActionController.startAction(
        name: '_ImagesController.setSearchFieldInitialValue');
    try {
      return super.setSearchFieldInitialValue(newValue);
    } finally {
      _$_ImagesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$_ImagesControllerActionController.startAction(
        name: '_ImagesController.refresh');
    try {
      return super.refresh();
    } finally {
      _$_ImagesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchFieldInitialValue: ${searchFieldInitialValue},
page: ${page},
perPage: ${perPage},
imagesStatus: ${imagesStatus},
photos: ${photos}
    ''';
  }
}

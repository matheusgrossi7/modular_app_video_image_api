// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$searchFieldInitialValueAtom =
      Atom(name: '_HomeController.searchFieldInitialValue');

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

  final _$pageAtom = Atom(name: '_HomeController.page');

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

  final _$perPageAtom = Atom(name: '_HomeController.perPage');

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

  final _$homeStatusAtom = Atom(name: '_HomeController.homeStatus');

  @override
  int get homeStatus {
    _$homeStatusAtom.reportRead();
    return super.homeStatus;
  }

  @override
  set homeStatus(int value) {
    _$homeStatusAtom.reportWrite(value, super.homeStatus, () {
      super.homeStatus = value;
    });
  }

  final _$photosAtom = Atom(name: '_HomeController.photos');

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

  final _$searchAsyncAction = AsyncAction('_HomeController.search');

  @override
  Future<void> search(String newSearchLabel) {
    return _$searchAsyncAction.run(() => super.search(newSearchLabel));
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void setHomeStatus(int newStatus) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setHomeStatus');
    try {
      return super.setHomeStatus(newStatus);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchFieldInitialValue(String newValue) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setSearchFieldInitialValue');
    try {
      return super.setSearchFieldInitialValue(newValue);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.refresh');
    try {
      return super.refresh();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchFieldInitialValue: ${searchFieldInitialValue},
page: ${page},
perPage: ${perPage},
homeStatus: ${homeStatus},
photos: ${photos}
    ''';
  }
}

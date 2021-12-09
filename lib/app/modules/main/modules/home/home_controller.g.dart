// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$photosAtom = Atom(name: '_HomeController.photos');

  @override
  ObservableFuture<PhotosResponse>? get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableFuture<PhotosResponse>? value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  final _$searchAtom = Atom(name: '_HomeController.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
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

  @override
  String toString() {
    return '''
photos: ${photos},
search: ${search},
page: ${page},
perPage: ${perPage}
    ''';
  }
}

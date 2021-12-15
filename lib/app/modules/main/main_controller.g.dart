// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainController on _MainController, Store {
  final _$currentPageIndexAtom = Atom(name: '_MainController.currentPageIndex');

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  final _$currentBottomNavIndexAtom =
      Atom(name: '_MainController.currentBottomNavIndex');

  @override
  int get currentBottomNavIndex {
    _$currentBottomNavIndexAtom.reportRead();
    return super.currentBottomNavIndex;
  }

  @override
  set currentBottomNavIndex(int value) {
    _$currentBottomNavIndexAtom.reportWrite(value, super.currentBottomNavIndex,
        () {
      super.currentBottomNavIndex = value;
    });
  }

  final _$changeCurrentPageIndexAsyncAction =
      AsyncAction('_MainController.changeCurrentPageIndex');

  @override
  Future<void> changeCurrentPageIndex(
      {required int newIndex,
      required AnimationController fadeOutAnimationController}) {
    return _$changeCurrentPageIndexAsyncAction.run(() => super
        .changeCurrentPageIndex(
            newIndex: newIndex,
            fadeOutAnimationController: fadeOutAnimationController));
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
currentBottomNavIndex: ${currentBottomNavIndex}
    ''';
  }
}

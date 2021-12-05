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

  final _$isPageTransitionAnimationReversedAtom =
      Atom(name: '_MainController.isPageTransitionAnimationReversed');

  @override
  bool get isPageTransitionAnimationReversed {
    _$isPageTransitionAnimationReversedAtom.reportRead();
    return super.isPageTransitionAnimationReversed;
  }

  @override
  set isPageTransitionAnimationReversed(bool value) {
    _$isPageTransitionAnimationReversedAtom
        .reportWrite(value, super.isPageTransitionAnimationReversed, () {
      super.isPageTransitionAnimationReversed = value;
    });
  }

  final _$_MainControllerActionController =
      ActionController(name: '_MainController');

  @override
  void init() {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.init');
    try {
      return super.init();
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentPageIndex(int newIndex) {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.changeCurrentPageIndex');
    try {
      return super.changeCurrentPageIndex(newIndex);
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
isPageTransitionAnimationReversed: ${isPageTransitionAnimationReversed}
    ''';
  }
}

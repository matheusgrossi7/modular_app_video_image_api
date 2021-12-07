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

  final _$isAnimationConcludedAtom =
      Atom(name: '_MainController.isAnimationConcluded');

  @override
  bool get isAnimationConcluded {
    _$isAnimationConcludedAtom.reportRead();
    return super.isAnimationConcluded;
  }

  @override
  set isAnimationConcluded(bool value) {
    _$isAnimationConcludedAtom.reportWrite(value, super.isAnimationConcluded,
        () {
      super.isAnimationConcluded = value;
    });
  }

  final _$_MainControllerActionController =
      ActionController(name: '_MainController');

  @override
  dynamic setIsAnimationConcluded(bool value) {
    final _$actionInfo = _$_MainControllerActionController.startAction(
        name: '_MainController.setIsAnimationConcluded');
    try {
      return super.setIsAnimationConcluded(value);
    } finally {
      _$_MainControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex},
currentBottomNavIndex: ${currentBottomNavIndex},
isAnimationConcluded: ${isAnimationConcluded}
    ''';
  }
}

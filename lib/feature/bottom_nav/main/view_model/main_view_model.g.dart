// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainViewModel on _MainViewModelBase, Store {
  final _$mainGroupButtonControllerAtom =
      Atom(name: '_MainViewModelBase.mainGroupButtonController');

  @override
  GroupButtonController get mainGroupButtonController {
    _$mainGroupButtonControllerAtom.reportRead();
    return super.mainGroupButtonController;
  }

  @override
  set mainGroupButtonController(GroupButtonController value) {
    _$mainGroupButtonControllerAtom
        .reportWrite(value, super.mainGroupButtonController, () {
      super.mainGroupButtonController = value;
    });
  }

  final _$mainGroupButtonSelectedIndexAtom =
      Atom(name: '_MainViewModelBase.mainGroupButtonSelectedIndex');

  @override
  int get mainGroupButtonSelectedIndex {
    _$mainGroupButtonSelectedIndexAtom.reportRead();
    return super.mainGroupButtonSelectedIndex;
  }

  @override
  set mainGroupButtonSelectedIndex(int value) {
    _$mainGroupButtonSelectedIndexAtom
        .reportWrite(value, super.mainGroupButtonSelectedIndex, () {
      super.mainGroupButtonSelectedIndex = value;
    });
  }

  final _$headerBottomButtonModelListAtom =
      Atom(name: '_MainViewModelBase.headerBottomButtonModelList');

  @override
  List<HeaderBottomButtonModel> get headerBottomButtonModelList {
    _$headerBottomButtonModelListAtom.reportRead();
    return super.headerBottomButtonModelList;
  }

  @override
  set headerBottomButtonModelList(List<HeaderBottomButtonModel> value) {
    _$headerBottomButtonModelListAtom
        .reportWrite(value, super.headerBottomButtonModelList, () {
      super.headerBottomButtonModelList = value;
    });
  }

  final _$_MainViewModelBaseActionController =
      ActionController(name: '_MainViewModelBase');

  @override
  String autoStatus() {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.autoStatus');
    try {
      return super.autoStatus();
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mainGroupButtonController: ${mainGroupButtonController},
mainGroupButtonSelectedIndex: ${mainGroupButtonSelectedIndex},
headerBottomButtonModelList: ${headerBottomButtonModelList}
    ''';
  }
}

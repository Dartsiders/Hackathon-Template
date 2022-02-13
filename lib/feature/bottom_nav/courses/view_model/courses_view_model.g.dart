// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoursesViewModel on _CoursesViewModelBase, Store {
  final _$lessonCarouselControllerAtom =
      Atom(name: '_CoursesViewModelBase.lessonCarouselController');

  @override
  CarouselController get lessonCarouselController {
    _$lessonCarouselControllerAtom.reportRead();
    return super.lessonCarouselController;
  }

  @override
  set lessonCarouselController(CarouselController value) {
    _$lessonCarouselControllerAtom
        .reportWrite(value, super.lessonCarouselController, () {
      super.lessonCarouselController = value;
    });
  }

  final _$lessonCarauselIndexAtom =
      Atom(name: '_CoursesViewModelBase.lessonCarauselIndex');

  @override
  int get lessonCarauselIndex {
    _$lessonCarauselIndexAtom.reportRead();
    return super.lessonCarauselIndex;
  }

  @override
  set lessonCarauselIndex(int value) {
    _$lessonCarauselIndexAtom.reportWrite(value, super.lessonCarauselIndex, () {
      super.lessonCarauselIndex = value;
    });
  }

  final _$quiz1CarouselControllerAtom =
      Atom(name: '_CoursesViewModelBase.quiz1CarouselController');

  @override
  CarouselController get quiz1CarouselController {
    _$quiz1CarouselControllerAtom.reportRead();
    return super.quiz1CarouselController;
  }

  @override
  set quiz1CarouselController(CarouselController value) {
    _$quiz1CarouselControllerAtom
        .reportWrite(value, super.quiz1CarouselController, () {
      super.quiz1CarouselController = value;
    });
  }

  final _$quiz1CarauselIndexAtom =
      Atom(name: '_CoursesViewModelBase.quiz1CarauselIndex');

  @override
  int get quiz1CarauselIndex {
    _$quiz1CarauselIndexAtom.reportRead();
    return super.quiz1CarauselIndex;
  }

  @override
  set quiz1CarauselIndex(int value) {
    _$quiz1CarauselIndexAtom.reportWrite(value, super.quiz1CarauselIndex, () {
      super.quiz1CarauselIndex = value;
    });
  }

  final _$quiz1PuanAtom = Atom(name: '_CoursesViewModelBase.quiz1Puan');

  @override
  int get quiz1Puan {
    _$quiz1PuanAtom.reportRead();
    return super.quiz1Puan;
  }

  @override
  set quiz1Puan(int value) {
    _$quiz1PuanAtom.reportWrite(value, super.quiz1Puan, () {
      super.quiz1Puan = value;
    });
  }

  @override
  String toString() {
    return '''
lessonCarouselController: ${lessonCarouselController},
lessonCarauselIndex: ${lessonCarauselIndex},
quiz1CarouselController: ${quiz1CarouselController},
quiz1CarauselIndex: ${quiz1CarauselIndex},
quiz1Puan: ${quiz1Puan}
    ''';
  }
}

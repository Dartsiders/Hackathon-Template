import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/view_model/courses_view_model.dart';

import '../../../../core/locator/locator.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final CoursesViewModel _coursesViewModel = locator<CoursesViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: AppTheme.theme.primaryColor,
        appBar: AppBar(
          title: Text('Ders Ekranı'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: _coursesViewModel.lessonCarouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) => {
                  _coursesViewModel.lessonCarauselIndex = index,
                },
                enableInfiniteScroll: false,
                height: 300.0,
                autoPlay: false,
                scrollPhysics: NeverScrollableScrollPhysics(),
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Placeholder(
                            fallbackHeight: 200,
                            color: Colors.grey,
                          ),
                          AppSize.lowHeightSizedBox,
                          Text(
                            'Eğitim Bilgisi',
                            style: AppTheme.theme.textTheme.headline5,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            AppSize.highHeightSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: FloatingActionButton(
                    heroTag: "dsfsdf",
                    onPressed: () {
                      if (_coursesViewModel.lessonCarauselIndex != 0) {
                        _coursesViewModel.lessonCarouselController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease);
                      }
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                AppSize.highWidthSizedBox,
                Container(
                  width: 100,
                  height: 100,
                  child: FloatingActionButton(
                    heroTag: "sdgfsf",
                    onPressed: () {
                      _coursesViewModel.lessonCarouselController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

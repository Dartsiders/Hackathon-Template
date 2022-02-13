import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/feature/bottom_nav/courses/view_model/courses_view_model.dart';

import '../../../../core/locator/locator.dart';

class QuizScreen1 extends StatefulWidget {
  const QuizScreen1({Key? key}) : super(key: key);

  @override
  _QuizScreen1State createState() => _QuizScreen1State();
}

class _QuizScreen1State extends State<QuizScreen1> {
  final CoursesViewModel _coursesViewModel = locator<CoursesViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: AppTheme.theme.primaryColor,
        appBar: AppBar(
          title: Text('Quiz Ekranı'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Puan : ${_coursesViewModel.quiz1Puan}',
                style: AppTheme.theme.textTheme.headline2),
            AppSize.highHeightSizedBox,
            CarouselSlider(
              carouselController: _coursesViewModel.quiz1CarouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) => {
                  _coursesViewModel.quiz1CarauselIndex = index,
                },
                enableInfiniteScroll: false,
                height: 300.0,
                autoPlay: false,
                scrollPhysics: NeverScrollableScrollPhysics(),
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: 300,
                      width: 300,
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        margin: const EdgeInsets.all(15),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Soru $i',
                                style: AppTheme.theme.textTheme.headline5,
                              ),
                              Text(
                                'Soru Yazısı',
                                style: AppTheme.theme.textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
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
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.red,
                      ),
                      elevation: MaterialStateProperty.all(
                        4,
                      ),
                    ),
                    onPressed: () {
                      _coursesViewModel.quiz1CarouselController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Text(
                      'Yanlış',
                      style: AppTheme.theme.textTheme.headline6,
                    ),
                  ),
                ),
                AppSize.highWidthSizedBox,
                Container(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.green,
                      ),
                      elevation: MaterialStateProperty.all(
                        4,
                      ),
                    ),
                    onPressed: () {
                      _coursesViewModel.quiz1CarouselController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Text(
                      'Doğru',
                      style: AppTheme.theme.textTheme.headline6,
                    ),
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

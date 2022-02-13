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
                height: 460.0,
                autoPlay: false,
                scrollPhysics: NeverScrollableScrollPhysics(),
              ),
              items: [
                "Koruma, Bildirme, Kurtarma (KBK) olarak ifade edilir.",
                "Koruma:\nKaza sonuçlarının ağırlaşmasını önlemek için olay yerinin değerlendirilmesini kapsar.",
                "En önemli işlem olay yerinde oluşabilecek tehlikeleri belirleyerek güvenli bir çevre oluşturmaktır.",
                "Bildirme:\n Olay / kaza mümkün olduğu kadar hızlı bir şekilde telefon veya diğer kişiler aracılığı ile gerekli yardım kuruluşlarına bildirilmelidir.",
                "Kurtarma-Müdahale:\n Olay yerinde hasta / yaralılara müdahale hızlı ancak sakin bir şekilde yapılmalıdır.",
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Card(
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/dokuz.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          AppSize.lowHeightSizedBox,
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '$i',
                                style: AppTheme.theme.textTheme.headline5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            AppSize.mediumHeightSizedBox,
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

import 'dart:ui';

import 'package:flutter/material.dart';
//import '../view_model/home_view_model.dart';

//import '../../../core/locator/locator.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  //final HomeViewModel _homeViewModel = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İlk Yardım Kursları"),
      ),
      body: const CoursesWidget(),
    );
  }
}

class CoursesWidget extends StatelessWidget {
  const CoursesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          CourseCard(),
          CourseCard(),
          CourseCard(),
          CourseCard(),
          CourseCard(),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => {}),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    "https://picsum.photos/200",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 8,
                    ),
                    child: const Icon(
                      Icons.lock,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Kursun Adı"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

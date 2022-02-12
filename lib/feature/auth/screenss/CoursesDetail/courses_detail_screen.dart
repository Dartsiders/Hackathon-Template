import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import '../view_model/home_view_model.dart';

//import '../../../core/locator/locator.dart';

class CoursesDetailScreen extends StatelessWidget {
  const CoursesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CourseDetail(),
    );
  }
}

class CourseDetail extends StatelessWidget {
  const CourseDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Observer(
        builder: (_) {
          return PageView(
            pageSnapping: true,
            //controller: pageController,
            // onPageChanged: null
            children: const [
              InformationCard(),
              InformationCard(),
            ],
          );
        },
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0XFF9f0101),
                    Color(0XFFdb0202),
                    Color(0XFFdd2727),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Center(
                        child: Text(
                          "İlk Yardım Hayat Kurtarır",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.network(
                      'https://picsum.photos/200',
                      width: 150,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper neque ut nulla pellentesque rhoncus. Donec quis elit malesuada, viverra arcu ac, mattis est. Aliquam eleifend nisl purus. Nullam ut pretium diam, eu placerat elit. Sed venenatis viverra pellentesque. Pellentesque fermentum tincidunt volutpat. Fusce a convallis nulla. Nam a magna vel neque pulvinar congue ac vel mi. Etiam purus velit, posuere vel commodo nec, egestas non augue. Donec hendrerit at ipsum at efficitur."),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    'https://picsum.photos/250?image=5',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

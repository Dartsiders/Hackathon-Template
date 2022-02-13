import 'dart:ui';

import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ayın Yıldızları",
          textAlign: TextAlign.center,
        ),
      ),
      body: const SuccessList(),
    );
  }
}

class SuccessList extends StatelessWidget {
  const SuccessList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Icon(Icons.star_border_outlined),
                ),
              ),
            ),
            title: Text("Başarılı kişinin ismi"),
            subtitle: Text("Score"),
          ),
        );
      },
      itemCount: 10,
    );
  }
}

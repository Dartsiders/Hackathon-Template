// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/feature/bottom_nav/accident/viewmodel/accident_viewmodel.dart';
import 'package:kartal/kartal.dart';

class ReportEmergency extends StatefulWidget {
  const ReportEmergency({Key? key}) : super(key: key);

  @override
  _ReportEmergencyState createState() => _ReportEmergencyState();
}

class _ReportEmergencyState extends State<ReportEmergency> {
  final AccidentViewModel _accidentViewModel = AccidentViewModel();

  int? _value = -1;
  int? _value2 = -1;
  int? _value3 = -1;
  int? _value4 = -1;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Report Emergency'),
            content: const Text('Are you sure you want to report emergency?'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _accidentViewModel.reportEmergency();
                },
              ),
              FlatButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Emergency'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_value == -1 ||
                  _value2 == -1 ||
                  _value3 == -1 ||
                  _value4 == -1) {
                Fluttertoast.showToast(msg: "Please select all options");
              } else {
                _accidentViewModel.updateEmergency(
                  _value == 0 ? "Evet" : "Hayır",
                  _value2 == 0
                      ? "1-3"
                      : _value2 == 1
                          ? "3-6"
                          : "6+",
                  _value3 == 0 ? "Evet" : "Hayır",
                  _value4 == 0 ? "Evet" : "Hayır",
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSize.mediumHeightSizedBox,
            Text(
              "Olay yerinde yangın var mı ?",
              style: context.textTheme.headline6,
            ),
            AppSize.lowHeightSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as int;
                        });
                      },
                    ),
                    const Text('Evet')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as int;
                        });
                      },
                    ),
                    const Text('Hayır')
                  ],
                ),
              ],
            ),
            AppSize.lowHeightSizedBox,
            Text(
              "Tahmini kişi sayısı:",
              style: context.textTheme.headline6,
            ),
            AppSize.lowHeightSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _value2,
                      onChanged: (value) {
                        setState(() {
                          _value2 = value as int;
                        });
                      },
                    ),
                    const Text('1 - 3')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _value2,
                      onChanged: (value) {
                        setState(() {
                          _value2 = value as int;
                        });
                      },
                    ),
                    const Text('3 - 6')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _value2,
                      onChanged: (value) {
                        setState(() {
                          _value2 = value as int;
                        });
                      },
                    ),
                    const Text('6 +')
                  ],
                ),
              ],
            ),
            Text(
              "Kişinin bilinci açık mı ?",
              style: context.textTheme.headline6,
            ),
            AppSize.lowHeightSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _value3,
                      onChanged: (index) {
                        setState(() {
                          _value3 = index as int;
                        });
                      },
                    ),
                    const Text('Evet')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _value3,
                      onChanged: (index) {
                        setState(() {
                          _value3 = index as int;
                        });
                      },
                    ),
                    const Text('Hayır')
                  ],
                ),
              ],
            ),
            AppSize.lowHeightSizedBox,
            Text(
              "Kişinin kanaması var mı ?",
              style: context.textTheme.headline6,
            ),
            AppSize.lowHeightSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _value4,
                      onChanged: (index) {
                        setState(() {
                          _value4 = index as int;
                        });
                      },
                    ),
                    const Text('Evet')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _value4,
                      onChanged: (index) {
                        setState(() {
                          _value4 = index as int;
                        });
                      },
                    ),
                    const Text('Hayır')
                  ],
                ),
              ],
            ),
            AppSize.lowHeightSizedBox,
          ],
        ),
      ),
    );
  }
}

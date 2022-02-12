import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathontemplate/core/app/color/app_color.dart';
import 'package:hackathontemplate/core/app/duration/app_duration.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_text_theme.dart';
import 'package:hackathontemplate/core/app/theme/app_theme.dart';
import 'package:hackathontemplate/core/extension/context_extension.dart';
import 'package:hackathontemplate/feature/bottom_nav/accident/viewmodel/accident_viewmodel.dart';

import '../../../core/locator/locator.dart';
import '../../init/view_model/init_view_model.dart';

class AccidentScreen extends StatefulWidget {
  const AccidentScreen({Key? key}) : super(key: key);

  @override
  _AccidentScreenState createState() => _AccidentScreenState();
}

class _AccidentScreenState extends State<AccidentScreen> {
  final InitViewModel _initViewModel = locator<InitViewModel>();
  final AccidentViewModel _accidentViewModel = locator<AccidentViewModel>();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _initViewModel.setLocationPermission();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 60.h,
            width: 200.w,
            child: FloatingActionButton.extended(
              onPressed: () {
                _accidentViewModel.reportEmergency(_descriptionController.text);
              },
              label: Row(
                children: [
                  Text(
                    "Kaza Bildir",
                    style: AppTextTheme.textTheme.subtitle1,
                  ),
                ],
              ),
              extendedIconLabelSpacing: 15,
              icon: Icon(
                Icons.report_gmailerrorred,
                size: 30.sp,
              ),
            ),
          ),
          body: Padding(
            padding: context.paddingNormal,
            child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                      height: context.mediaQuery.viewInsets.bottom > 0
                          ? 0
                          : context.height * 0.1,
                      duration: AppDuration.lowDuration,
                      child: Text("Kaza Bildirme",
                          style: AppTextTheme.textTheme.headline4)),
                  AppSize.mediumHeightSizedBox,
                  InkWell(
                    onTap: () => _accidentViewModel.setProfileImage(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: _accidentViewModel.imageFile != null
                            ? DecorationImage(
                                image: FileImage(_accidentViewModel.imageFile!)
                                    as ImageProvider,
                                fit: BoxFit.cover,
                              )
                            : null,
                        color: AppColor.greyColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      height: 250.h,
                      child: Center(
                        child: Visibility(
                          visible: _accidentViewModel.imageFile == null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: 50.sp,
                                color: AppColor.whiteColor,
                              ),
                              AppSize.mediumHeightSizedBox,
                              Text(
                                'Kazanın fotoğrafını yükleyin',
                                style:
                                    AppTextTheme.textTheme.headline5?.copyWith(
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppSize.highHeightSizedBox,
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Kaza Hakkında Kısa Bilgi...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ),
                  ),
                  AppSize.mediumHeightSizedBox,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

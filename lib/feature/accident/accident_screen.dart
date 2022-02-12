import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathontemplate/core/app/color/app_color.dart';
import 'package:hackathontemplate/core/app/size/app_size.dart';
import 'package:hackathontemplate/core/app/theme/app_text_theme.dart';
import 'package:hackathontemplate/core/extension/context_extension.dart';
import 'package:hackathontemplate/feature/accident/viewmodel/accident_viewmodel.dart';

import '../../core/locator/locator.dart';
import '../init/view_model/init_view_model.dart';

class AccidentScreen extends StatefulWidget {
  const AccidentScreen({Key? key}) : super(key: key);

  @override
  _AccidentScreenState createState() => _AccidentScreenState();
}

class _AccidentScreenState extends State<AccidentScreen> {
  final InitViewModel _initViewModel = locator<InitViewModel>();
  final AccidentViewModel _accidentViewModel = locator<AccidentViewModel>();

  @override
  void initState() {
    _initViewModel.setLocationPermission();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(),
        body: Padding(
          padding: context.paddingNormal,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AppSize.mediumHeightSizedBox,
                InkWell(
                  onTap: () => _accidentViewModel.setProfileImage(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _accidentViewModel.imageFile != null
                            ? FileImage(_accidentViewModel.imageFile!)
                                as ImageProvider
                            : const NetworkImage(
                                "",
                              ),
                        fit: BoxFit.cover,
                      ),
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
                              style: AppTextTheme.textTheme.headline5?.copyWith(
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                AppSize.mediumHeightSizedBox,
                const AccidentDescriptionField(),
                AppSize.mediumHeightSizedBox,
                SizedBox(
                  height: 70.h,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _accidentViewModel.getCurrentLocation();
                    },
                    icon: Icon(
                      Icons.report_gmailerrorred,
                      size: 50.sp,
                    ),
                    label: Text(
                      "Kaza Bildir",
                      style: AppTextTheme.textTheme.headline6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text(
        'Report an accident',
      ),
      centerTitle: true,
    );
  }
}

class ReportAccidentButton extends StatelessWidget {
  const ReportAccidentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.report_gmailerrorred,
          size: 50.sp,
        ),
        label: Text(
          "Kaza Bildir",
          style: AppTextTheme.textTheme.headline6,
        ),
      ),
    );
  }
}

class AccidentDescriptionField extends StatelessWidget {
  const AccidentDescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        maxLines: 8,
        decoration: InputDecoration(
          hintText: 'Kaza Hakkında Kısa Bilgi...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      ),
    );
  }
}

class AccidentPhotoField extends StatelessWidget {
  const AccidentPhotoField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      height: 250.h,
      child: Center(
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
              style: AppTextTheme.textTheme.headline5?.copyWith(
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

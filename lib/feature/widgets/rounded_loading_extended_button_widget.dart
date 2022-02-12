import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

// ignore: must_be_immutable
class RoundedLoadingExtendedButtonWidget extends StatelessWidget {
  String text = "";
  RoundedLoadingButtonController controller = RoundedLoadingButtonController();
  Function() onPressed;
  Icon? leadingIcon;
  Widget? leadingWidget;
  Icon? trailingIcon;
  Widget? trailingWidget;
  double? width;
  Widget? middleWidget;
  Color? buttonColor;

  RoundedLoadingExtendedButtonWidget(
    this.text,
    this.controller,
    this.onPressed, {
    this.leadingIcon,
    this.leadingWidget,
    this.trailingIcon,
    this.trailingWidget,
    this.width,
    this.middleWidget,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.transparent,
      disabledElevation: 0,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      label: RoundedLoadingButton(
        width: width ?? 150,
        elevation: 4,
        color: buttonColor ?? Colors.blueAccent,
        // ignore: sort_child_properties_last
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            leadingWidget ?? Container(),
            leadingIcon ?? Container(),
            const SizedBox(
              width: 10,
            ),
            middleWidget ?? Container(),
            Text(text),
            const SizedBox(
              width: 10,
            ),
            trailingIcon ?? Container(),
            trailingWidget ?? Container(),
          ],
        ),
        controller: controller,
        onPressed: onPressed,
      ),
      onPressed: () {
        //formKeyVerify.currentState!.save();
      },
    );
  }
}

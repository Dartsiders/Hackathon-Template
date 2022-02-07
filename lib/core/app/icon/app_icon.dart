import 'package:flutter/material.dart';


class AppIcon {
  AppIcon._();

  static const close = Icons.close;
  static const check = Icons.check;
  static const info = Icons.info;
  static const chat = Icons.chat;

  static Icon get closeIcon => const Icon(close);
  static Icon get checkIcon => const Icon(
        check,
      );
  static Icon get infoIcon => const Icon(info);
  static Icon get chatIcon => const Icon(chat);

  static Icon colorfulIcon({required Color? appColor, required IconData appIcon}) =>
      Icon(
        appIcon,
        color: appColor,
      );
}

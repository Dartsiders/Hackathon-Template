import 'package:flutter/material.dart';

class AppSize {
  AppSize._();
  static const zero = 0.0;
  static const low = 10.0;
  static const medium = 20.0;
  static const high = 50.0;

  static SizedBox get zeroSizedBox => const SizedBox(height: zero, width: zero);

  static SizedBox get lowHeightSizedBox => const SizedBox(
        height: low,
      );
  static SizedBox get mediumHeightSizedBox => const SizedBox(
        height: medium,
      );
  static SizedBox get highHeightSizedBox => const SizedBox(
        height: high,
      );

  static SizedBox get lowWidthSizedBox => const SizedBox(
        width: low,
      );
  static SizedBox get mediumWidthSizedBox => const SizedBox(
        width: medium,
      );
  static SizedBox get highWidthSizedBox => const SizedBox(
        width: high,
      );
}

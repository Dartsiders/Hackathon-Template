class AppDuration {
  AppDuration._();
  static const low = 250;
  static const medium = 500;
  static const high = 1000;

  static Duration get lowDuration => const Duration(milliseconds: low);
  static Duration get mediumDuration => const Duration(milliseconds: medium);
  static Duration get highDuration => const Duration(milliseconds: high);
}

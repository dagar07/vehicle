import 'package:flutter/material.dart';

class Responsive {
  static BuildContext context;
  /// Small screen is any screen whose width is less than 800 pixels
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  /// Large screen is any screen whose width is more than 1200 pixels
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  /// Medium screen is any screen whose width is less than 1200 pixels,
  /// and more than 800 pixels
  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600 &&
    MediaQuery.of(context).size.width < 1200;
  }

  static aspectRatio(context) {
    return MediaQuery.of(context).size.height/MediaQuery.of(context).size.width;
  }

  static responsiveSize(size) {
    final exSize = isSmallScreen(context) ? size : size * aspectRatio(context);
    return exSize;
  }
}
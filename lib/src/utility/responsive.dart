import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Responsive {
  static BuildContext context;
  /// Small screen is any screen whose width is less than 600 pixels
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  /// Large screen is any screen whose width is more than 1200 pixels
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  /// Medium screen is any screen whose width is less than 1200 pixels,
  /// and more than 600 pixels
  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600 &&
    MediaQuery.of(context).size.width < 1200;
  }

  /// Small screen landscape is any screen whose height is less than 600 pixels
  static bool isSmallDeviceLandscape() {
    return MediaQuery.of(context).size.height < 600;
  }

  static aspectRatio(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MediaQuery.of(context).orientation == Orientation.landscape ? width/height: height/width;
  }

  static responsiveSize(size) {
    final exSize = isSmallScreen(context) || isSmallDeviceLandscape() ? size : size * aspectRatio(context);
    return exSize;
  }
}
import 'dart:ui';

final double pixelRatio = window.devicePixelRatio;

final Size physicalScreenSize = window.physicalSize;

final padding = window.padding;
final paddingTop = window.padding.top / pixelRatio;
final paddingBottom = window.padding.bottom / pixelRatio;

final double screenHeight = physicalScreenSize.height / pixelRatio;
final double screenWidth = physicalScreenSize.width / pixelRatio;

// 768
final double appHeight = screenHeight - paddingTop;
// 375
final double appWidth = screenWidth;

final double contentPadding = appWidth * 0.0666667;
final double navigationHeight = screenHeight * 0.1;

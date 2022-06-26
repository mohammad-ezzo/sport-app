import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

// ui helper
class SizeConfig {
  static const double designHeight = 812;
  static const double designWidth = 375;

  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void init(BuildContext context) {
    if (_mediaQueryData == null || kDebugMode) {
      _mediaQueryData = MediaQuery.of(context);

      screenWidth = _mediaQueryData!.size.width;
      screenHeight = _mediaQueryData!.size.height;
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;
      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    }
  }

  static bool isWideScreen() {
    return screenWidth > 450;
  }

  // get vertical percentage size
  static double h(double hPerc) {
    return blockSizeVertical * (hPerc * 100 / designHeight);
  }

  // get horizontal percentage size
  static double w(double wPerc) {
    return blockSizeHorizontal * (wPerc * 100 / designWidth);
  }
}

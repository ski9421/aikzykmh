import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen {
  static height(num v) {
    return ScreenUtil().setHeight(v);
  }

  static width(num v) {
    return ScreenUtil().setWidth(v);
  }

  static size(num v) {
    return ScreenUtil().setSp(v);
  }

  //屏幕宽度
  static getScreenWidth() {
    return ScreenUtil().screenWidth;
  }

  //屏幕高度
  static getScreenHeight() {
    return ScreenUtil().screenHeight;
  }
}
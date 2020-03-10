import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';


String _center = 'center';
String _swPanB = 'swPanBoundary';
String _nePanB = 'nePanBoundary';
String _urlTemplate = 'urlTemplate';
class MapConfig {
  static setOption(center, swPanBoundary, nePanBoundary, urlTemplate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
 
    await prefs.setString(_center, center);
    await prefs.setString(_swPanB, swPanBoundary);
    await prefs.setString(_nePanB, nePanBoundary);
    await prefs.setString(_urlTemplate, urlTemplate);
  }

  static getOption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //int counter = (prefs.getInt('counter') ?? 0) + 1;
    var center = (await prefs.getString(_center)).split(',');
    var swPanBoundary = (await prefs.getString(_swPanB)).split(',');
    var nePanBoundary = (await prefs.getString(_nePanB)).split(',');
    var urlTemplate = await prefs.getString(_urlTemplate);
    print('--center-- $center');
    return {
      "center": LatLng(double.parse(center[0]), double.parse(center[1])),
      "swPanBoundary": LatLng(double.parse(swPanBoundary[0]), double.parse(swPanBoundary[1])),
      "nePanBoundary": LatLng(double.parse(nePanBoundary[0]), double.parse(nePanBoundary[1])),
      "urlTemplate": urlTemplate,
    };

  }
}

class ScreenUtil {
  /// screen height
  /// 当前屏幕 高
  static double screenH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height;
  }
  /// screen width
  /// 当前屏幕 宽
  static double screenW(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width;
  }
}

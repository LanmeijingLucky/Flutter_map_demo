import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import './splash.dart';
import './pages/alarmdetail_page.dart';
import './pages/form_page.dart';
import './pages/two_page.dart';
import './pages/homeMap.dart';
import './pages/bottomdrag.dart';
import './pages/slidePanel.dart';
import './pages/deviceslist_page.dart';
import './pages/timeline_page.dart';
import './homePage.dart';

void main(){
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        "/": (context) => SplashWidget(),
        "home": (context) => MyHomePage(),
        'map': (context) => HomeMap(),
        //'map': (context) => SlidePanel(),
        'alarmdetail_page': (context) => AlarmDetailPage(),
        'mapoption_page': (context) => FormTestRoute(),
        'two_page': (context) => Home(),
        'devicelist_page': (context) => DevicesListPage(),
        'timeline_page': (context) => TimelinePage(),
      },
      //home: new FormTestRoute(),
  ));
  // android 状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

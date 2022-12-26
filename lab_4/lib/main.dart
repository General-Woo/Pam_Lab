import 'package:di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_4/pages/home/home_page.dart';
import 'package:flutter/services.dart';

void main() async {
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
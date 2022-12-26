import 'package:flutter/material.dart';
import 'package:lab_3/screen/start.dart';
import 'package:lab_3/screen/quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 3',
        theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
           style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(37, 44, 50, 1),
            ),
          ),
        ),
      themeMode: ThemeMode.light,
      routes: {
        '/Start' : (context) => const Start(),
        '/Quiz' : (context) => const Quiz(),
      },
      initialRoute: '/Start',
    );
  }
}
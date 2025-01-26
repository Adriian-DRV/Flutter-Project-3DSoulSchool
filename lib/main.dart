import 'package:flutter/material.dart';
import 'package:navegacion_carpetas/screen_one.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: ScreenOne(), //La pantalla 1 es la inicial de la app
    );
  }
}
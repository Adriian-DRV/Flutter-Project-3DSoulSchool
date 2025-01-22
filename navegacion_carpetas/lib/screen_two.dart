import 'package:flutter/material.dart';
import 'package:navegacion_carpetas/screen_one.dart';
import 'package:navegacion_carpetas/screen_three.dart';

void main() {
  runApp(ScreenTwo());
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    Color _colorScreen = Colors.cyanAccent;
    Color _colorAppBar = Colors.greenAccent;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _colorScreen,
        appBar: AppBar(
          title: const Text("PANTALLA 2"),
          backgroundColor: _colorAppBar,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => anteriorPantalla(context),
                child: const Text("ANTERIOR PANTALLA"),
              ),
              ElevatedButton(
                  onPressed: () => siguientePantalla(context), 
                  child: const Text("SIGUIENTE PANTALLA")),
            ],
          ),
        ),
      ),
    );
  }

  anteriorPantalla(BuildContext context) {
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => ScreenOne()));
  }

  siguientePantalla(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScreenThree()));
  }
}

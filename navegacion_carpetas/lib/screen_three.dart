import 'package:flutter/material.dart';
import 'package:navegacion_carpetas/screen_two.dart';


void main(){
    runApp(ScreenThree());
}

class ScreenThree extends StatelessWidget {
    const ScreenThree({super.key});

    @override
    Widget build(BuildContext context) {
        Color _colorScreen = Colors.redAccent;
        Color _colorAppBar = Colors.orangeAccent;

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                backgroundColor: _colorScreen,
                appBar: AppBar(
                    title: const Text("PANTALLA 3"),
                    backgroundColor: _colorAppBar,
                ),
                body: Center(
                    child: ElevatedButton(
                        onPressed: () => anteriorPantalla(context),
                        child: const Text("PANTALLA ANTERIOR")
                    ),
                ),
            ),
        );
    }

    anteriorPantalla(BuildContext context){
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => ScreenTwo()));
    }
}
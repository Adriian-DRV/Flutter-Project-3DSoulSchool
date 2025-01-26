import 'package:flutter/material.dart';
import 'package:navegacion_carpetas/screen_two.dart'; // Importamos la clase de la pantalla 2

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Elimina la etiqueta de debug
      home: ScreenOne(), // Pantalla inicial
    );
  }
}*/

class ScreenOne extends StatelessWidget {
  // Constructor de la clase ScreenOne
  ScreenOne({Key? key}) : super(key: key);

  // Declaración del Controller
  final TextEditingController _controllerPasswd = TextEditingController();
  final _password = "Pepe";

  @override
  Widget build(BuildContext context) {
    Color _myColor = Colors.blue;
    Color _secondaryColor = Colors.red;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Elimina la etiqueta de debug
      home: Scaffold(
      appBar: AppBar(
        title: const Text("PANTALLA 1"),
        backgroundColor: _secondaryColor,
      ),
      backgroundColor: _myColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Contraseña:",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20), // Espacio entre el texto y el TextField
            TextField(
              controller: _controllerPasswd, 
              obscureText: false, // No Ocultamos el texto de contraseña para la prueba
              decoration: const InputDecoration(
                labelText: "Introduce una contraseña",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Llamar a la función siguientePantalla correctamente
                siguientePantalla(context);
              },
              child: const Text("SIGUIENTE PANTALLA"),
            ),
          ],
        ),
      ),
    ));
  }

  // Método para navegar a la siguiente pantalla
  void siguientePantalla(BuildContext context) {
    if(_controllerPasswd.text == _password){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ScreenTwo()),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Contraseña incorrecta"),
          duration: Duration(seconds: 1), //Tiempo que estará el snackbar en pantalla si falla la contraseña
        ),
      );
    }
  }
}

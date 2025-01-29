import 'package:flutter/material.dart';
import 'package:navegacion_carpetas/database_service.dart'; // Importamos el archivo database_service.dart
import 'package:navegacion_carpetas/screen_two.dart'; // Importamos la clase de la pantalla 2

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
                const SizedBox(
                    height: 20), // Espacio entre el texto y el TextField
                TextField(
                  controller: _controllerPasswd,
                  obscureText:
                      true, // Ocultamos el texto de contraseña para la prueba
                  decoration: const InputDecoration(
                    labelText: "Introduce una contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // Llamar a la función de guardar contraseña y navegar a la siguiente pantalla
                    _savePasswd(context);
                  },
                  child: const Text("SIGUIENTE PANTALLA"),
                ),
              ],
            ),
          ),
        ));
  }

  //Método para guardar la contraseña en la base de datos y navegar a la siguiente pantalla
  void _savePasswd(BuildContext context) async {
    final passwd = _controllerPasswd
        .text; //La contraseña introducida por el usuario se guarda en una variable llamada passwd

    if (passwd.isNotEmpty) {
      //Si la contraseña no esta vacía
      await DatabaseService.savePasswd(
          passwd); //Se guarda la contraseña en la base de datos

      //Navegamos a la siguiente pantalla
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ScreenTwo()),
      );
    } else {
      //Si la contraseña esta vacía
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Debes introducir una contraseña")),
      );
    }
  }
}

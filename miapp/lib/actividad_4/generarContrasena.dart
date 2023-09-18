import 'package:miapp/actividad_4/controllers/PasswordProvider.dart';
import 'package:miapp/actividad_4/views/forms/FormPassword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Ojalá así como declaro variables me le pudiera declarar a ella

class generarContrasena extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _generarContrasena();
  }
}

class _generarContrasena extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generador de Contraseñas"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ChangeNotifierProvider(
          create: (context) => PasswordProvider(),
          child: FormPassword(),
        ),
      ),
    );
  }
}

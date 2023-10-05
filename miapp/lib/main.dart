import 'package:miapp/actividad_3/actividad_3.dart';
import 'package:flutter/material.dart';
import 'package:miapp/actividad_4/generarContrasena.dart';
import 'package:miapp/marvel/views/heroeCard.dart';
import 'package:miapp/actividad_5/loginForm.dart';

//Ojalá así como declaro variables me le pudiera declarar a ella
void main() {
  runApp(AppBases());
}

class AppBases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: createScaffold(),
      routes: {
        "actividad_3": (context) => actividad_3(),
        "generarContrasena": (context) => generarContrasena(),
        "heroeCard": (context) => heroesCard(),
        "loginform": (context) => LoginForm(),
      },
    );
  }
}

createScaffold() {
  List examples = [
    {"name": "Actividad 3", "route": "actividad_3"},
    {"name": "Actividad 4", "route": "generarContrasena"},
    {"name": "MarvelApp", "route": "heroeCard"},
    {"name": "Inicio de Sesión", "route": "loginform"}
  ];

  return Scaffold(
    appBar: AppBar(title: const Text("Repo Santi Yepes")),
    body: ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(examples[index]["name"]),
          onTap: () {
            routing(context, examples[index]["route"]);
          },
        );
      },
      itemCount: examples.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black,
      ),
    ),
  );
}

void routing(BuildContext context, String route) {
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => AgendaMain(),
  //   ),
  // );
  Navigator.pushNamed(context, route);
}

import 'package:miapp/actividad_5/controllers/UserProvider.dart';
import 'package:miapp/actividad_5/views/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State {
  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de sesion"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: RefreshIndicator.adaptive(
          onRefresh: refresh,
          child: ChangeNotifierProvider(
            create: (context) => UserProvider(),
            child: FormUser(),
          ),
        ),
      ),
    );
  }
}

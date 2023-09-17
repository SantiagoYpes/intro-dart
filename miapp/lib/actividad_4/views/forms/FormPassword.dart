import 'package:flutter/services.dart';
import 'package:miapp/actividad_4/controllers/PasswordProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPassword extends StatefulWidget {
  FormPassword({
    super.key,
  });

  @override
  State<FormPassword> createState() => _FormPasswordState();
}

class _FormPasswordState extends State<FormPassword> {
  double length = 50;
  @override
  Widget build(BuildContext context) {
    PasswordProvider _passwordProvider = Provider.of<PasswordProvider>(context);
    generarContrasenaCon() {
      _passwordProvider.pass = _passwordProvider.funcionGenerarContrasena();
      setState(() {});
    }

    return Form(
      key: _passwordProvider.keyFormUser,
      child: ListView(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: TextEditingController(
                text: _passwordProvider.len.round().toString()),
            validator: (value) {
              RegExp exp = RegExp(r'^(100|[1-9]?[0-9])$');
              if (value == null) {
                return "Campo obligatorio";
              }
              if (!exp.hasMatch(value)) {
                return "Valida el dato ingresado";
              }
            },
            onChanged: (value) {
              _passwordProvider.len = double.parse(value);
              generarContrasenaCon();
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: "Entre 0 y 25",
              labelText: "Longitud",
              focusColor: Colors.red,
              counterText: "2",
            ),
            keyboardType: TextInputType.number,
          ),
          Slider(
            value: (_passwordProvider.len / 100) * 4,
            onChanged: (value) {
              _passwordProvider.len = (value * 100) / 4;
              generarContrasenaCon();
              setState(() {});
            },
            activeColor: Colors.red,
            inactiveColor: Colors.red.shade100,
          ),
          Center(
            child: Text(
              "${_passwordProvider.len.round()}",
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
          CheckboxListTile(
            value: _passwordProvider.op1,
            onChanged: (value) {
              _passwordProvider.op1 = !_passwordProvider.op1;
              generarContrasenaCon();
              setState(() {});
            },
            title: const Text("Mayúsculas"),
            activeColor: Colors.red,
          ),
          CheckboxListTile(
            value: _passwordProvider.op2,
            onChanged: (value) {
              _passwordProvider.op2 = !_passwordProvider.op2;
              generarContrasenaCon();
              setState(() {});
            },
            activeColor: Colors.red,
            title: const Text("Minúsculas"),
          ),
          CheckboxListTile(
            value: _passwordProvider.op3,
            onChanged: (value) {
              _passwordProvider.op3 = !_passwordProvider.op3;
              generarContrasenaCon();
              setState(() {});
            },
            activeColor: Colors.red,
            title: const Text("Números"),
          ),
          CheckboxListTile(
            value: _passwordProvider.op4,
            onChanged: (value) {
              _passwordProvider.op4 = !_passwordProvider.op4;
              generarContrasenaCon();
              setState(() {});
            },
            activeColor: Colors.red,
            title: const Text("Símbolos"),
          ),
          ElevatedButton.icon(
            onPressed: () {
              generarContrasenaCon();
            },
            icon: const Icon(Icons.password_rounded),
            label: const Text("Generar Contraseña"),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textPass(_passwordProvider),
                copyPass(_passwordProvider, context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton copyPass(
      PasswordProvider _passwordProvider, BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: _passwordProvider.pass));
        showDialog(
          context: context,
          builder: (BuildContext context) => dialogCopy(context),
        );
      },
      icon: const Icon(
        Icons.copy,
        color: Colors.red,
      ),
      label: const Text(
        "Copiar",
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Dialog dialogCopy(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Copiado.'),
            const SizedBox(
              height: 15,
              width: 10,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              label: const Text(
                'Close',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text textPass(PasswordProvider _passwordProvider) {
    return Text(
      "${_passwordProvider.pass}",
      style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
    );
  }
}

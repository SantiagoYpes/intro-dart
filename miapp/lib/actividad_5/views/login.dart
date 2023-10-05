import 'package:miapp/actividad_5/controllers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

InputDecoration inputText(hintext, labeltext) {
  return InputDecoration(
      icon: const Icon(
        Icons.password,
        color: Colors.blueAccent,
      ),
      contentPadding: const EdgeInsets.all(4),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 234, 234, 234),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 234, 234, 234)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 234, 234, 234)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      hintText: hintext,
      labelText: labeltext);
}

class FormUser extends StatefulWidget {
  FormUser({
    super.key,
  });

  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      child: formCard(_userProvider),
    );
  }

  Card formCard(UserProvider _userProvider) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _userProvider.keyFormUser,
          child: listViewForm(_userProvider),
        ),
      ),
    );
  }

  ListView listViewForm(UserProvider _userProvider) {
    return ListView(
      children: [
        const Icon(
          Icons.person,
          color: Colors.blueAccent,
          size: 150,
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            _userProvider.user = value;
            setState(() {});
          },
          validator: (value) {
            RegExp exp = RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$');
            if (value == null) {
              return "Campo obligatorio";
            }
            if (!exp.hasMatch(value)) {
              return "Ingrese un email válido.";
            }
          },
          decoration: inputText("Ingrese el usuario", "Usuario"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          onChanged: (value) {
            _userProvider.password = value;
            setState(() {});
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            RegExp exp = RegExp(r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$');
            if (value == null) {
              return "Campo obligatorio";
            }
            if (!exp.hasMatch(value)) {
              return "La contraseña debe tener una minúscula, una mayúscula y caractéres especiales.";
            }
          },
          decoration: inputText("Ingrese la contraseña", "Contraseña"),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
        CheckboxListTile(
          value: true,
          onChanged: (value) {
            null;
            setState(() {});
          },
          activeColor: Colors.blueAccent,
          secondary: const Text("Términos y Condiciones"),
        ),
        itemsLog(),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: () {},
          icon: const Icon(Icons.login),
          label: const Text("Iniciar Sesión"),
        ),
      ],
    );
  }

  Row itemsLog() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blueAccent),
          child: const Icon(Icons.facebook),
          onPressed: () {
            print('Facebook');
          },
        ),
        const SizedBox(
          width: 15,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blueAccent),
          child: const Icon(Icons.email),
          onPressed: () {
            print('Facebook');
          },
        ),
        const SizedBox(
          width: 15,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blueAccent),
          child: const Icon(Icons.laptop),
          onPressed: () {
            print('Facebook');
          },
        )
      ],
    );
  }
}

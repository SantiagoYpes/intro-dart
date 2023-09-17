import 'dart:math';

import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  GlobalKey keyFormUser = GlobalKey();

  double len = (50 / 4);
  bool op1 = true;
  bool op2 = true;
  bool op3 = true;
  bool op4 = true;
  String pass = "";
  String minusculas = 'abcdefghijklmnopqrstuvwxyz';
  String mayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String numeros = '0123456789';
  String simbolos = '!@#%^&*()_-+=<>?';

  String funcionGenerarContrasena() {
    int length = len.round();
    final List<String> charCategories = [];
    if (op1) {
      charCategories.add(mayusculas);
    }

    if (op2) {
      charCategories.add(minusculas);
    }

    if (op3) {
      charCategories.add(numeros);
    }

    if (op4) {
      charCategories.add(simbolos);
    }
    final random = Random();

    final passwordChars = List.generate(length, (index) {
      final categoryIndex = random.nextInt(charCategories.length);
      final categoryChars = charCategories[categoryIndex];
      final charIndex = random.nextInt(categoryChars.length);
      return categoryChars[charIndex];
    });
    return passwordChars.join();
  }
}

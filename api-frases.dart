import 'dart:async';
import 'src/Frases.dart';

void main() async {
  try {
    await consultarFrases();
  } catch (e) {
    print("Ha ocurrido un error: $e");
  }
}

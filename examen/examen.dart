import 'dart:ffi';
import 'dart:io';

void convertirAFarenheit(temp) {

  double resultado = (temp * 1.8) + 32;
  print("El resultado es: $resultado grados Farenheit");
}

void convertirAGrados(temp) {
  double resultado = (temp -32 ) / 1.8;
  print("El resultado es: $resultado grados Celcius");
}
void main(List<String> args) {
  int opcion = 0;

  while (opcion != 2) {
    print('Ingrese temperatura');
    double temp = double.parse(stdin.readLineSync().toString());
    print('Ingresa la opción');
    print('1. Grados Celcius a Farenheit');
    print('2. Grados Farenheit a Celcius ');
    opcion = int.parse(stdin.readLineSync().toString());
    
    opcion == 1 ? convertirAFarenheit(temp) : convertirAGrados(temp); 
  }
}

import 'dart:io';

void verEstadisticas(List<Persona> personas) {
  int homacu = 0;
  int hysacu = 0;
  int edadhycacu = 0;
  int mysacu = 0;
  int solacu = 0;
  int edadhycsum = 0;
  for (var persona in personas) {
    if (persona.gen == genero.H) {
      homacu++;
      if (persona.est == estadoC.S) {
        hysacu++;
        solacu++;
      }
      if (persona.est == estadoC.C) {
        print(persona.edad);
        edadhycsum += persona.edad;
        print(edadhycsum);
        edadhycacu++;
      }
    } else {
      if (persona.est == estadoC.S) {
        mysacu++;
        solacu++;
      }
    }
  }
  double estad1 = (hysacu / homacu) * 100;
  double estad2 = (mysacu / solacu) * 100;
  double estad3 = edadhycsum / edadhycacu;
  print(edadhycsum);
  print(edadhycacu);
  print(
      "El porcentaje de hombres solteros con respecto a los hombres es del $estad1%");
  print(
      "El porcentaje de mujeres solteras con respecto a los solteros es del $estad2%");
  print("El promedio de la edad de casados es $estad3");
}

void main(List<String> args) {
  int opcion = 0;
  List<Persona>? personas = [];
  genero gene = genero.H;
  estadoC esta = estadoC.S;
  int edad = 0;
  while (opcion != 2) {
    print('Ingresa tu genero');
    print('1. Si eres hombre');
    print('2. Si eres mujer');
    opcion = int.parse(stdin.readLineSync().toString());
    opcion == 1 ? gene = genero.H : gene = genero.M;
    print('1. Si eres soltero');
    print('2. Si eres casado');
    print('3. Si eres viudo');
    opcion = int.parse(stdin.readLineSync().toString());
    switch (opcion) {
      case 1:
        esta = estadoC.S;
      case 2:
        esta = estadoC.C;
      case 3:
        esta = estadoC.V;
        break;
      default:
    }
    print('Ingresa tu edad');
    edad = int.parse(stdin.readLineSync().toString());
    Persona persona =  Persona(gene, esta, edad);
    personas.add(persona);
    print("1. Ver Estadísticas y Agregar otra Persona");
    print("2. Salir del programa");
    opcion = int.parse(stdin.readLineSync().toString());
    opcion == 1 ? verEstadisticas(personas) : print("Progrema finalizado");
  }
}

enum genero { H, M }

enum estadoC { S, C, V }

class Persona {
  genero gen = genero.H;
  estadoC est = estadoC.S;
  int edad = 0;

  Persona(genero gen, estadoC est, int edad) {
    this.est = est;
    this.gen = gen;
    this.edad = edad;
  }
}

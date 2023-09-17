import 'src/ListHeroes.dart';

void main() async {
  try {
    await consultarHeroes();
  } catch (e) {
    print("Ha ocurrido un error: $e");
  }
}

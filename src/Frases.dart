import 'dart:convert' as convert;
import '../models/frase.dart';
import 'package:http/http.dart' as http;

Future consultarFrases() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview

  Uri url = Uri.https('api.chucknorris.io', '/jokes/random', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    String? frase = jsonResponse['value'];
    print('La frase es: $frase.');

    Frase fraseClase = Frase.fromJson(
        id: jsonResponse['id'],
        value: jsonResponse['value'],
        icon_url: jsonResponse['icon_url'],
        created_at: jsonResponse['created_at'],
        updated_at: jsonResponse['updated_at'],
        url: jsonResponse['url']);
    print(fraseClase.value);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

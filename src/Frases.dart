import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

Future consultarFrases() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url =Uri.https('api.chucknorris.io', '/jokes/random', {'q': '{http}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    String? frase = jsonResponse['value'];
    print('La frase es: $frase.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}


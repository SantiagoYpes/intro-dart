import 'dart:convert' as convert;
import '../controllers/httpService.dart';
import '../models/Hero.dart';
import 'dart:math';

HttpService httpService = HttpService();

Future<dynamic> consultarHeroes() async {
  int ts = 21;
  String hash = '78ca84cf14899fc8e9679108d1cffeab';
  String apikey = '8b29bc630dd53f8cbe2ddb63722ffff0';
  int num = Random().nextInt(1541);
  //int num = 0;
  //https://gateway.marvel.com:443/v1/public/characters?ts=21&apikey=8b29bc630dd53f8cbe2ddb63722ffff0&hash=78ca84cf14899fc8e9679108d1cffeab&offset=0
  String url =
      'https://gateway.marvel.com:443/v1/public/characters?ts=$ts&apikey=$apikey&hash=$hash&offset=$num';
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview

  dynamic response = await httpService.get(Uri.parse(url));
  // Await the http get response, then decode the json-formatted response.
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    List heroes = jsonResponse['data']['results'];
    List<Heroe> heroesList = [];
    for (var heroe in heroes) {
      int id = heroe['id'];
      String name = heroe['name'];
      String path = heroe['thumbnail']['path'];
      String extension = heroe['thumbnail']['extension'];
      String description = heroe['description'];

      if (description == "") {
        description = "No description for this hero";
      }
      int numcomics = heroe['comics']['available'];
      int numseries = heroe['series']['available'];
      int numevents = heroe['events']['available'];
      int numstories = heroe['stories']['available'];
      List seriesList = heroe['series']['items'];
      if (numseries >= 3) {
        seriesList = seriesList.sublist(0, 3);
      } else if (numseries == 2) {
        seriesList = seriesList.sublist(0, 2);
      } else if (numseries == 1) {
        seriesList = seriesList.sublist(0, 1);
      } else {
        seriesList.add({'name': "There are no series to show"});
      }
      Heroe heroeClase = Heroe.fromJson(
          id: id,
          name: name,
          path: path,
          extension: extension,
          description: description,
          numcomics: numcomics,
          numseries: numseries,
          numevents: numevents,
          numstories: numstories,
          seriesList: seriesList);
      heroesList.add(heroeClase);
    }

    return heroesList;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

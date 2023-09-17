class Heroe {
  int id = 0;
  String name = "";
  String path = "";
  String extension = "";
  String description = "";
  int numcomics = 0;
  int numseries = 0;
  int numevents = 0;
  int numstories = 0;
  List seriesList = [];

  Heroe.fromJson(
      {required int id,
      required String name,
      required String path,
      required String extension,
      required String description,
      required int numcomics,
      required int numseries,
      required int numevents,
      required int numstories,
      required List seriesList}) {
    this.name = name;
    this.id = id;
    this.path = path;
    this.extension = extension;
    this.description = description;
    this.numcomics = numcomics;
    this.numseries = numseries;
    this.numstories = numstories;
    this.numevents = numevents;
    this.seriesList = seriesList;
  }
}

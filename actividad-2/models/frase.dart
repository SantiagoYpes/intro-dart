class Frase {
  String id = "";
  String icon_url = "";
  String? created_at = "";
  String updated_at = "";
  String value = "";
  String url = "";

  Frase.fromJson(
      {required String id,
      required String icon_url,
      required String created_at,
      required String updated_at,
      required String value,
      required String url}) {
    this.id = id;
    this.icon_url = icon_url;
    this.created_at = created_at;
    this.updated_at = updated_at;
    this.value = value;
    this.url = url;
  }
}

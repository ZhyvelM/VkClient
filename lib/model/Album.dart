class Album {
  String id;
  String title;
  String coverUrl;
  int size;

  Album(this.id, this.title, this.coverUrl, this.size);

  factory Album.fromJson(dynamic json) {
    String url = (json["sizes"] as List<dynamic>).last["src"];
    return Album((json["id"] as int).toString(), json["title"] as String, url,
        json["size"] as int);
  }
}

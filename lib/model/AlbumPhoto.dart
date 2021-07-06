class AlbumPhoto{
  String id;
  String urlMin;
  String urlMax;

  AlbumPhoto(this.id, this.urlMin, this.urlMax);

  factory AlbumPhoto.fromJson(dynamic json){

    return AlbumPhoto(
        json["id"].toString(),
        json["sizes"][0]["url"],
        json["sizes"][json["sizes"].length-1]["url"]
    );
  }
}
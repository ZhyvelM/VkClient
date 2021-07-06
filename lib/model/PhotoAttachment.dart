class PhotoAttachment {
  String albumId;
  String date;
  String miniUrl;
  String origUrl;

  PhotoAttachment(this.albumId, this.date, this.miniUrl, this.origUrl);

  factory PhotoAttachment.fromJson(dynamic json) {
    List<dynamic> ls = json["sizes"];
    return PhotoAttachment(
        (json["album_id"] as int).toString(),
        (json["date"] as int).toString(),
        json["sizes"][0]["url"],
        json["sizes"][ls.length-1]["url"]);
  }
}

import 'package:flutter/material.dart';
import 'package:vkontakte/model/PhotoAttachment.dart';

class Post {
  String authorName;
  String authorUrl;
  String sourceId;
  String date;
  String text;
  List<PhotoAttachment> attachments;
  List<String> otherAttachments;

  Post(this.authorName, this.authorUrl, this.sourceId, this.date, this.text,
      this.attachments, this.otherAttachments);

  factory Post.fromJson(dynamic json, dynamic groups) {
    String name = "";
    String url = "";
    String id = ((json["source_id"] as int) < 0
            ? (json["source_id"] as int) * -1
            : (json["source_id"] as int))
        .toString();

    (groups as List<dynamic>).forEach((element) {
      if ((element["id"] as int).toString() == id) {
        name = element["name"];
        url = element["photo_50"];
      }
    });
    List<dynamic> att = json["attachments"];
    List<PhotoAttachment> photos = [];
    List<String> posts = [];
    att.forEach((element) {
      if (element["type"].toString() == "photo") {
        photos.add(PhotoAttachment.fromJson(element["photo"]));
      } else {
        posts.add(element["type"]);
      }
    });
    return Post(name, url, id, (json["date"] as int).toString(),
        json["text"] as String, photos, posts);
  }
}

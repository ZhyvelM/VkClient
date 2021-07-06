import 'package:flutter/material.dart';
import 'package:vkontakte/model/Album.dart';
import 'package:vkontakte/model/AlbumPhoto.dart';
import 'package:vkontakte/service/HubService.dart';

class HubModel {

  Future<List<Album>> getAlbums(String id) async {
    Map<String, dynamic> map = await hubService.getPhotoAlbums(id);
    List<Album> albums = [];
    (map["items"] as List<dynamic>).forEach((element) {
      albums.add(Album.fromJson(element));
    });
    return albums;
  }

  Future<List<AlbumPhoto>> getAlbum(String id, String albumId) async {
    Map<String, dynamic> map = await hubService.getAlbum(id, albumId);
    List<AlbumPhoto> photos = [];
    (map["items"] as List<dynamic>).forEach((element) {
      photos.add(AlbumPhoto.fromJson(element));
    });
    return photos;
  }
}

HubModel hubModel = HubModel();

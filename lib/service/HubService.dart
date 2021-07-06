import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vkontakte/util.dart' as util;

class HubService {
  Future<http.Response> _setupRequest(
      String method, String userId, String version, List<String> params) async {
    String query = "";
    params.forEach((element) {
      query += "$element&";
    });
    return await http.get(Uri.parse('https://api.vk.com/method/$method?'
        'access_token=${util.accessToken}&'
        'user_id=$userId&'
        'v=$version&'
        '$query'));
  }

  Future<Map<String, dynamic>> getPhotoAlbums(String id) async {
    final response = await _setupRequest("photos.getAlbums", id, "5.131",
        ["owner_id=$id", "need_covers=1", "need_system=1", "photo_sizes=1"]);
    print("##RESPONSE GET ALBUMS: ${response.body}");
    return jsonDecode(response.body)['response'];
  }

  Future<Map<String, dynamic>> getAlbum(String id, String albumId) async {
    final response = await _setupRequest("photos.get", id, "5.131",
        ["owner_id=$id", "album_id=$albumId"]);
    print("##RESPONSE GET ALBUM: ${response.body}");
    return jsonDecode(response.body)['response'];
  }
}

HubService hubService = HubService();

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vkontakte/util.dart' as util;

class WallService {
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

  Future<Map<String, dynamic>> getPosts() async {
    var response = await _setupRequest(
        "newsfeed.get", util.userId, "5.131", ["filters=post"]);
    print("##RESPONSE GET POSTS response: ${response.body}");
    return jsonDecode(response.body)['response'];
  }
}

WallService wallService = WallService();

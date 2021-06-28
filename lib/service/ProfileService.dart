import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vkontakte/util.dart' as util;

class ProfileService {
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

  Future<Map<String, dynamic>> getProfile(String id) async {
    final response = await _setupRequest(
        "users.get", id, "5.23", ["fields=photo_50,photo_100"]);
    print("##RESPONSE GET PROFILE: ${response.body}");
    return jsonDecode(response.body)['response'][0];
  }

  Future<Map<String, dynamic>> getFriends(String id) async {
    var response = await _setupRequest("friends.get", id, "5.21",
        ['fields=photo_50,photo_100', 'order=hints']);
    print("##RESPONSE GET FRIENDS: ${response.body}");
    return jsonDecode(response.body)['response'];
  }

  Future<String> getStatus(String id) async {
    final response = await _setupRequest("status.get", id, "5.21", []);
    print("##RESPONSE GET STATUS: ${response.body}");
    return jsonDecode(response.body)['response']["text"];
  }

  Future<void> setStatus(String text) async {
    await _setupRequest("status.set", util.userId, "5.21", ["text=$text"]);
  }
}

ProfileService profileService = ProfileService();

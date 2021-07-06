import 'package:vkontakte/model/User.dart';
import 'package:vkontakte/service/ProfileService.dart';

class ProfileModel {
  Future<User> getProfile(String id) async {
    var profile = await profileService.getProfile(id);
    var user = User.fromJson(profile);
    user.setStatus(await getStatus(id));
    return user;
  }

  Future<List<User>> getFriends(String id) async {
    var responseMap = await profileService.getFriends(id);
    List<User> friends = [];
    (responseMap["items"] as List<dynamic>).forEach((element) {
      friends.add(User.fromJson(element));
    });
    return friends;
  }

  Future<String> getStatus(String id) async {
    return await profileService.getStatus(id);
  }

  void setStatus(String text) {
    profileService.setStatus(text);
  }
}

ProfileModel profileModel = ProfileModel();

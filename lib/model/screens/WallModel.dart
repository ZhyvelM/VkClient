import 'package:vkontakte/service/WallService.dart';

import '../Post.dart';

class WallModel {
  Future<List<Post>> getPosts() async {
    var responseMap = await wallService.getPosts();
    List<Post> posts = [];
    (responseMap["items"] as List<dynamic>).forEach((element) {
      try{
      Post post = Post.fromJson(element, responseMap["groups"]);
      posts.add(post);
      }catch (error){
        print(error);
      }
    });
    print("##POST: ${posts.length}");
    return posts;
  }
}

WallModel wallModel = WallModel();

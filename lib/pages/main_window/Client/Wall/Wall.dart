import 'package:flutter/material.dart';
import 'package:vkontakte/model/Post.dart';
import 'package:vkontakte/model/screens/WallModel.dart';
import 'package:vkontakte/pages/main_window/Client/widgets/NavBar.dart';
import 'package:vkontakte/pages/main_window/Client/widgets/Post.dart';

class Wall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<Post>> _posts = wallModel.getPosts();
    return Scaffold(
        body: FutureBuilder<List<Post>>(
            future: _posts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Flex(
                      direction: Axis.vertical,
                        children: [PostWidget(post: snapshot.data[index])]
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
        bottomNavigationBar: NavBar(
          currentIndex: 0,
        )
    );
  }
}

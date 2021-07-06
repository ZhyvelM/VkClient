import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vkontakte/model/Post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(children: [
          Row(children: [
            CircleAvatar(radius: 25, backgroundImage: NetworkImage(post.authorUrl)),
            SizedBox(width: 15,),
            Text(post.authorName)
          ]),
          Divider(),
          Text(post.text),
          // ListView.builder(
          //    shrinkWrap: true,
          //    scrollDirection: Axis.horizontal,
          //    itemCount: post.attachments.length,
          //    itemBuilder: (BuildContext context, int index) =>
          //      Container(
          //        margin: EdgeInsets.symmetric(horizontal: 10),
          //        decoration: BoxDecoration(
          //            image: DecorationImage(
          //                image: NetworkImage(post.attachments[index].miniUrl)
          //            )
          //        ),
          //      ),
          //  )
          ]
        )
    );
  }
}

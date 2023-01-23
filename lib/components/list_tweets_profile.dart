import 'package:flutter/material.dart';
import 'package:twitter_ui/components/user_post.dart';

class Tweets_Profle extends StatefulWidget {
  final bool like;
  final bool rt;

  const Tweets_Profle({Key? key, required this.like, required this.rt})
      : super(key: key);

  @override
  State<Tweets_Profle> createState() => _Tweets_ProfleState();
}

class _Tweets_ProfleState extends State<Tweets_Profle> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 100,
        itemBuilder: (context, index) {
          return User_Post(
              name: 'name', likePublication: widget.like, rt: widget.rt);
        });
  }
}

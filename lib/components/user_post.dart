import 'package:flutter/material.dart';
import 'package:twitter_ui/components/profil_picture.dart';

class User_Post extends StatefulWidget {
  final String name;

  const User_Post({Key? key, required this.name}) : super(key: key);

  @override
  State<User_Post> createState() => _User_PostState();
}

class _User_PostState extends State<User_Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Profile_Picture(taille: 40),
              Container(
                width: 3,
                height: MediaQuery.of(context).size.height / 2.4,
                color: Colors.grey,
              ),
              Profile_Picture(taille: 23),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('  @${widget.name} * 19h'),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(height: 8),
              Row(
                children: [
                  _iconUnderPost(Icons.bar_chart, '10 258'),
                  _iconUnderPost(Icons.mode_comment_outlined, '216'),
                  _iconUnderPost(Icons.repeat, '2 664'),
                  _iconUnderPost(Icons.bar_chart, '7 532'),
                  Icon(Icons.share)
                ],
              ),
              Container(
                height: 10,
              ),
              Text('Afficher cette discussion', style: TextStyle(color: Colors.blue),)
            ],
          )
        ],
      ),
    );
  }

  Widget _iconUnderPost(IconData icondata, String number) {
    return Row(
      children: [
        Icon(icondata),
        Text(number),
        Container(
          width: 10,
        )
      ],
    );
  }
}

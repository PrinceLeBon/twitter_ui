import 'package:flutter/material.dart';
import 'package:twitter_ui/components/icon_under_post.dart';
import 'package:twitter_ui/components/profil_picture.dart';
import 'package:twitter_ui/components/share_tweet.dart';

class User_Post extends StatefulWidget {
  final String name;
  bool likePublication = false;
  bool rt = false;

  User_Post(
      {Key? key,
      required this.name,
      required this.likePublication,
      required this.rt})
      : super(key: key);

  @override
  State<User_Post> createState() => _User_PostState();
}

class _User_PostState extends State<User_Post> {
  bool comment = false;
  bool share = true;
  Color couleur = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              Profile_Picture(taille: 40),
              Container(
                width: 3,
                height: MediaQuery.of(context).size.height / 2.4,
                color: Colors.grey,
              ),
              const Profile_Picture(taille: 23),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('  @${widget.name} * 19h'),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: const Text(
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
                  IconUnderPost(
                      icondata: Icons.bar_chart,
                      number: '10 258',
                      buttonType: '',
                      selectedColor: Colors.black,
                      defaultColor: Colors.black,
                      f: _nothing,
                      action: false,
                      rt: widget.rt,
                      likePublication: widget.likePublication),
                  Container(
                    width: 10,
                  ),
                  IconUnderPost(
                      icondata: Icons.mode_comment_outlined,
                      number: '216',
                      buttonType: '',
                      selectedColor: Colors.black,
                      defaultColor: Colors.black,
                      f: _comment,
                      action: comment,
                      rt: widget.rt,
                      likePublication: widget.likePublication),
                  Container(
                    width: 10,
                  ),
                  IconUnderPost(
                      icondata: Icons.repeat,
                      number: '2 664',
                      buttonType: 'R',
                      selectedColor: Colors.green,
                      defaultColor: couleur,
                      f: _rt,
                      action: widget.rt,
                      rt: widget.rt,
                      likePublication: widget.likePublication),
                  Container(
                    width: 10,
                  ),
                  IconUnderPost(
                      icondata: Icons.favorite_border,
                      number: '7 532',
                      buttonType: 'L',
                      selectedColor: Colors.red,
                      defaultColor: couleur,
                      f: _likePublication,
                      action: widget.likePublication,
                      rt: widget.rt,
                      likePublication: widget.likePublication),
                  Container(
                    width: 10,
                  ),
                  IconUnderPost(
                      icondata: Icons.share,
                      number: '',
                      buttonType: '',
                      selectedColor: Colors.black,
                      defaultColor: Colors.black,
                      f: _shareTweet,
                      action: false,
                      rt: widget.rt,
                      likePublication: widget.likePublication),
                ],
              ),
              Container(
                height: 10,
              ),
              const Text(
                'Afficher cette discussion',
                style: TextStyle(color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }

  void _likePublication(bool value) {
    setState(() {
      widget.likePublication = !value;
    });
  }

  void _rt(bool value) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 130,
              child: Column(
                children: [
                  Container(height: 20),
                  _childShowModalBottomSheetOfRetweet(
                      Icons.repeat, 'Retweeter', 'R', widget.rt),
                  _childShowModalBottomSheetOfRetweet(
                      Icons.note_alt_outlined, 'Citer le Tweet', '', false),
                ],
              ),
            ),
          );
        });
  }

  void _comment(bool value) {
    setState(() {
      comment = !value;
    });
  }

  void _nothing(bool value) {}

  Widget _childShowModalBottomSheetOfRetweet(
      IconData icon, String label, String typeofbutton, bool value) {
    return InkWell(
      onTap: () {
        if (typeofbutton == 'R') {
          setState(() {
            widget.rt = !value;
            (widget.rt) ? couleur = Colors.green : couleur = Colors.black;
          });
          Navigator.pop(context);
        }
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          Container(
            width: 10,
          ),
          Text(label),
          Container(height: 50),
        ],
      ),
    );
  }

  void _shareTweet(bool share) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (builder) {
          return const ShareTweet();
        });
  }
}

import 'package:flutter/material.dart';
import 'package:twitter_ui/components/profil_picture.dart';

class User_Post extends StatefulWidget {
  final String name;

  const User_Post({Key? key, required this.name}) : super(key: key);

  @override
  State<User_Post> createState() => _User_PostState();
}

class _User_PostState extends State<User_Post> {
  bool likePublication = false;
  bool rt = false;
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
              Profile_Picture(taille: 23),
            ],
          ),
          SizedBox(
            width: 5,
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
                  _iconUnderPost(Icons.bar_chart, '10 258', '', Colors.black,
                      Colors.black, _nothing, false),
                  Container(
                    width: 10,
                  ),
                  _iconUnderPost(Icons.mode_comment_outlined, '216', '',
                      Colors.black, Colors.black, _comment, comment),
                  Container(
                    width: 10,
                  ),
                  _iconUnderPost(Icons.repeat, '2 664', '', Colors.green,
                      couleur, _rt, rt),
                  Container(
                    width: 10,
                  ),
                  _iconUnderPost(
                      Icons.favorite_border,
                      '7 532',
                      'L',
                      Colors.red,
                      Colors.black,
                      _likePublication,
                      likePublication),
                  Container(
                    width: 10,
                  ),
                  _iconUnderPost(Icons.share, '', '', Colors.black,
                      Colors.black, _shareTweet, false),
                ],
              ),
              Container(
                height: 10,
              ),
              Text(
                'Afficher cette discussion',
                style: TextStyle(color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _iconUnderPost(IconData icondata, String number, String buttonType,
      Color selectedColor, Color defaultColor, Function(bool) f, bool action) {
    return InkWell(
      onTap: () {
        f(action);
      },
      splashColor: Colors.transparent,
      child: Row(
        children: [
          Icon(
              (buttonType == 'L' && likePublication)
                  ? Icons.favorite
                  : icondata,
              color: (buttonType == 'R' && rt)
                  ? selectedColor
                  : (buttonType == 'L' && likePublication)
                      ? selectedColor
                      : defaultColor),
          Text(number,
              style: TextStyle(
                  color: (buttonType == 'R' && rt)
                      ? selectedColor
                      : (buttonType == 'L' && likePublication)
                          ? selectedColor
                          : defaultColor)),
        ],
      ),
    );
  }

  void _likePublication(bool value) {
    setState(() {
      likePublication = !value;
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
            padding: EdgeInsets.only(left: 20),
            child: Container(
              height: 130,
              child: Column(
                children: [
                  Container(height: 20),
                  _childShowModalBottomSheetOfRetweet(
                      Icons.repeat, 'Retweeter', 'R', rt),
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
            rt = !value;
            (rt) ? couleur = Colors.green : couleur = Colors.black;
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
          return /*ListView(
            children: [*/
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 20),
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Partager le Tweet',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Container(height: 20,),
                                _recentFriends('José Mari'),
                                Container(height: 20,),
                                _recentFriends('Lionel Messi'),
                                Container(height: 20,),
                                _option1(Icons.message_outlined, 'Envoyer par Message Privé'),
                                Container(height: 20,),
                              ],
                            )),
                        Container(height: 1, color: Colors.grey,),
                        Container(height: 20,),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              _option1(Icons.people, 'Partager avec la Communauté'),
                              Container(height: 20,),
                              Row(
                                children: [
                                  _option2(Icons.share, 'Partager via'),
                                  Container(width: 20,),
                                  _option2(Icons.bookmark_add_outlined, 'Ajouter aux signets'),
                                  Container(width: 20,),
                                  _option2(Icons.link, 'Copier le lien'),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(height: 20,),
                        Container(height: 1, color: Colors.grey,),
                        Container(height: 20,),
                        Container(
                          height: 105,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _option2(Icons.chat_bubble, 'WhatsApp'),
                              Container(width: 10,),
                              _option2(Icons.camera_alt_outlined, 'Stories Instagram'),
                              Container(width: 10,),
                              _option2(Icons.snapchat, 'Caméra Snapchat'),
                              Container(width: 10,),
                              _option2(Icons.messenger, 'Discussion Messenger'),
                              Container(width: 10,),
                              _option2(Icons.chat_bubble, 'Messages'),
                              Container(width: 10,),
                              _option2(Icons.facebook, 'Facebook'),
                              Container(width: 10,),
                              _option2(Icons.telegram_outlined, 'Telegram')
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            /*],
          )*/;
        });
  }

  Widget _recentFriends(String name){
    return Row(
      children: [
        Profile_Picture(taille: 30),
        Container(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(name +'  ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('@${name}')
              ],
            ),
            Text('par Message Privé', style: TextStyle(color: Colors.grey, fontSize: 12),)
          ],
        )
      ],
    );
  }

  Widget _option1(IconData icon, String label){
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        Container(width: 10,),
        Text(label)
      ],
    );
  }

  Widget _option2(IconData icon, String libelle) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.circular(50)),
          child: Icon(icon),
        ),
        Container(
          height: 10,
        ),
        Container(
          width: 90,
          height: 40,
          child: Text(libelle, textAlign: TextAlign.center,),
        )
      ],
    );
  }
}

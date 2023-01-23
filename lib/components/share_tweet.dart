import 'package:flutter/material.dart';
import 'package:twitter_ui/components/profil_picture.dart';

class ShareTweet extends StatelessWidget {
  const ShareTweet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        height: 20,
                      ),
                      _recentFriends('José Mari'),
                      Container(
                        height: 20,
                      ),
                      _recentFriends('Lionel Messi'),
                      Container(
                        height: 20,
                      ),
                      _option1(
                          Icons.message_outlined, 'Envoyer par Message Privé'),
                      Container(
                        height: 20,
                      ),
                    ],
                  )),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Container(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    _option1(Icons.people, 'Partager avec la Communauté'),
                    Container(
                      height: 20,
                    ),
                    Row(
                      children: [
                        _option2(Icons.share, 'Partager via'),
                        Container(
                          width: 20,
                        ),
                        _option2(
                            Icons.bookmark_add_outlined, 'Ajouter aux signets'),
                        Container(
                          width: 20,
                        ),
                        _option2(Icons.link, 'Copier le lien'),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 105,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _option2(Icons.chat_bubble, 'WhatsApp'),
                    Container(
                      width: 10,
                    ),
                    _option2(Icons.camera_alt_outlined, 'Stories Instagram'),
                    Container(
                      width: 10,
                    ),
                    _option2(Icons.snapchat, 'Caméra Snapchat'),
                    Container(
                      width: 10,
                    ),
                    _option2(Icons.messenger, 'Discussion Messenger'),
                    Container(
                      width: 10,
                    ),
                    _option2(Icons.chat_bubble, 'Messages'),
                    Container(
                      width: 10,
                    ),
                    _option2(Icons.facebook, 'Facebook'),
                    Container(
                      width: 10,
                    ),
                    _option2(Icons.telegram_outlined, 'Telegram')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _recentFriends(String name) {
    return Row(
      children: [
        Profile_Picture(taille: 30),
        Container(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(name + '  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('@${name}')
              ],
            ),
            Text(
              'par Message Privé',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        )
      ],
    );
  }

  Widget _option1(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        Container(
          width: 10,
        ),
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
          child: Text(
            libelle,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

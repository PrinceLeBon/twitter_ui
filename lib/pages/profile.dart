import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_ui/components/list_tweets_profile.dart';
import 'package:twitter_ui/components/profil_picture.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File? image1;
  File? image2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          key: _scaffoldKey,
          body: Container(
            margin: MediaQuery.of(context).padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white12,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: InkWell(
                          child: Container(
                              height: 110,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue,
                              child: (image1) != null
                                  ? Image.file(
                                      image1!,
                                      width: MediaQuery.of(context).size.width,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    )
                                  : Container()),
                          onTap: () {
                            pickImage(ImageSource.gallery, 'image1');
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white12,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 15,
                        child: InkWell(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: (image2) != null
                                    ? ClipOval(
                                        child: Image.file(
                                          image2!,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 140,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const Profile_Picture(taille: 50),
                              ),
                            ),
                            onTap: () {
                              pickImage(ImageSource.gallery, 'image2');
                            }),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 15,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                '  Editer le profil  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 10,
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.black54, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.keyboard_control_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 60,
                        top: 10,
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.black54, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 10,
                        child: InkWell(
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.black54, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('@UsernameXxx'),
                      Container(
                        height: 10,
                      ),
                      Icon(Icons.flag_outlined),
                      Container(
                        height: 10,
                      ),
                      _row1(Icons.location_on_outlined, 'République du Bénin',
                          Colors.blueAccent),
                      Container(
                        height: 10,
                      ),
                      _row1(Icons.calendar_month,
                          'A rejoint Twitter en janvier 2018', Colors.blueGrey),
                      Container(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          Text(
                            '667',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Abonnements'),
                          Text(
                            '  361',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('abonnés'),
                        ],
                      )
                    ],
                  ),
                ),
                const TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        icon: Text(
                          'Tweets',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          'Tweets et réponses',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          'Médias',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          'J\'aime',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                const Expanded(
                    child: TabBarView(children: [
                  Tweets_Profle(like: true, rt: true),
                  Tweets_Profle(like: true, rt: true),
                  Tweets_Profle(like: false, rt: false),
                  Tweets_Profle(like: true, rt: false),
                ]))
              ],
            ),
          ),
        ));
  }

  Widget _row1(IconData icon, String label, Color couleur) {
    return Row(
      children: [
        Icon(icon),
        Container(
          width: 5,
        ),
        Text(
          label,
          style: TextStyle(color: couleur),
        ),
      ],
    );
  }

  Future pickImage(ImageSource source, String __image) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      final imageTemporary = File(_image.path);
      setState(() {
        (__image == 'image1')
            ? image1 = imageTemporary
            : image2 = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Echec dans la sélection de limage: $e');
    }
  }
}

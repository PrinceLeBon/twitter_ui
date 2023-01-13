import 'package:flutter/material.dart';
import 'package:twitter_ui/components/user_post.dart';

import '../components/profil_picture.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List people = [
    'john',
    'prince',
    'le bon',
    'amehomin',
    'jefferson',
    'mahugnon',
    'jeff',
    'mcgod'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Icon(Icons.circle, color: Colors.blue,),
        ),
        backgroundColor: Colors.white,
        leading: const Padding(padding: EdgeInsets.all(10), child: Profile_Picture(taille: 10)),
        elevation: 0,
        actions: [
          const Icon(Icons.star, color: Colors.black87,),
          Container(width: 10,)
        ],
      ),
      body: ListView.builder(
              scrollDirection: Axis.vertical,
            itemCount: people.length,
            itemBuilder: (context, index){
              return User_Post(name: people[index]);
            }
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:twitter_ui/components/profil_picture.dart';
import 'package:twitter_ui/pages/profile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: MediaQuery.of(context).padding,
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Profile_Picture(taille: 40),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Profile()));
                    },
                  ),
                  const Icon(Icons.blur_circular)
                ],
              ),
              Container(
                height: 10,
              ),
              const Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text('@UsernameXxx'),
              Container(
                height: 10,
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
              ),
              Container(
                height: 20,
              ),
              const Divider(
                height: 10,
              ),
              Container(
                height: 30,
              ),
              InkWell(
                child: _childDrawer1(Icons.person_outlined, 'Profil', 18),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
              Container(
                height: 20,
              ),
              _childDrawer1(Icons.message_outlined, 'Sujets', 18),
              Container(
                height: 20,
              ),
              _childDrawer1(Icons.bookmark_border, 'Signets', 18),
              Container(
                height: 20,
              ),
              _childDrawer1(Icons.list_alt, 'Listes', 18),
              Container(
                height: 20,
              ),
              _childDrawer1(Icons.people_alt_outlined, 'Cercle Twitter', 18),
              Container(
                height: 20,
              ),
              const Divider(
                height: 50,
              ),
              Container(
                height: 20,
              ),
              _childDrawer2(Icons.arrow_drop_down, 'Outils professionnels'),
              Container(
                height: 20,
              ),
              _childDrawer2(Icons.arrow_drop_down, 'Paramètres et support'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _childDrawer1(IconData icon, String label, double _size) {
    return Row(
      children: [
        Icon(icon),
        Container(
          width: 10,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: _size),
        ),
      ],
    );
  }

  Widget _childDrawer2(IconData icon, String label) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}

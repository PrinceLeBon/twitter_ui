import 'package:flutter/material.dart';
import 'package:twitter_ui/components/profil_picture.dart';
import 'package:twitter_ui/pages/home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentindex = 0;

  late final List<Widget> _differentpages = [
    Home()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _differentpages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
          onTap: _changePage,
          items: [
            BottomNavigationBarItem(icon: Icon((currentindex == 0) ? Icons.home : Icons.home_outlined, size: 27, color: Colors.black,), label: ''),
            BottomNavigationBarItem(icon: Icon((currentindex == 1) ? Icons.search : Icons.search_rounded, size: 27, color: Colors.black), label: ''),
            BottomNavigationBarItem(icon: Icon((currentindex == 2) ? Icons.people : Icons.people_alt_outlined, size: 27, color: Colors.black), label: ''),
            BottomNavigationBarItem(icon: Icon((currentindex == 3) ? Icons.notifications : Icons.notifications_outlined, size: 27, color: Colors.black), label: ''),
            BottomNavigationBarItem(icon: Icon((currentindex == 4) ? Icons.message : Icons.message_outlined, size: 27, color: Colors.black), label: '')
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    setState(() {
    });
  }

  void _changePage(int index){
    setState(() {
      currentindex = index;
    });
  }
}
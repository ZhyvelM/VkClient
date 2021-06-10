import 'package:flutter/material.dart';
import 'package:vkontakte/screens/Hub/Hub.dart';
import 'package:vkontakte/screens/Profile/Profile.dart';
import 'package:vkontakte/screens/Wall/Wall.dart';

class Client extends StatefulWidget {
  const Client({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ClientWidgetState();
}

class _ClientWidgetState extends State<StatefulWidget> {
  var _selectedIndex = 0;

  List<Widget> screens = <Widget>[
    Wall(),
    Hub(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterVKClient"),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.perm_media), label: "Hub"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

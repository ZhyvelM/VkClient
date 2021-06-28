import 'package:flutter/material.dart';
import 'package:vkontakte/pages/main_window/Client/widgets/NavBar.dart';

class Hub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("HUB")),
        bottomNavigationBar: NavBar(
          currentIndex: 1,
        ));
  }
}

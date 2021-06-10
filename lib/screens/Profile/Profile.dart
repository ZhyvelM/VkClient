import 'package:flutter/material.dart';

import 'Header.dart';
import 'ProfileState.dart';
import 'ProfileWall.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Header(), ProfileState(), ProfileWall()],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../client_cubit/client_cubit.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;

  NavBar({@required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      final clientCubit = BlocProvider.of<ClientCubit>(context);
      switch (index) {
        case 0:
          {
            clientCubit.switchToWall();
          }
          break;
        case 1:
          {
            clientCubit.switchToHub();
          }
          break;
        case 2:
          {
            clientCubit.switchToProfile();
          }
      }
    }

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.perm_media), label: "Hub"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}

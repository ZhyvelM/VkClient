import 'package:flutter/material.dart';

class HubButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function callBack;
  final Color color;

  HubButton(
      {@required this.icon,
      @required this.text,
      @required this.callBack,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 50,
            ),
            Text(
              text,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }
}

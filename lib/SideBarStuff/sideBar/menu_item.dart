import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.cyan,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 26, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItemPlayers extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final Color color;
  final Color iconColor;

  const MenuItemPlayers({Key key, this.icon, this.title, this.onTap, this.color, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22, color: color),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  const BaseAppBar({required this.title, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: title,
      actions: [
        Icon(Icons.notifications),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        Icon(Icons.account_circle),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10))
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

import 'package:flutter/material.dart';
import 'package:it_security_app/Screens/Angebote/angebot_screen.dart';
import 'package:it_security_app/Screens/Home/home_screen.dart';
import 'package:it_security_app/Screens/Login/login_screen.dart';
import 'package:it_security_app/Screens/Quiz/quiz_screen.dart';
import 'package:it_security_app/Screens/Settings/settings_screen.dart';
import 'package:it_security_app/Screens/Software/software_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
            color: Colors.white,
            child: ListView(padding: padding, children: <Widget>[
              const SizedBox(height: 48),
              buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Quiz',
                icon: Icons.live_help,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Angbote',
                icon: Icons.local_offer,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Login',
                icon: Icons.login,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Software',
                icon: Icons.api,
                onClicked: () => selectedItem(context, 5),
              )
            ])));
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.blue;
    final hoverColor = Colors.blue;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 16)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuizScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AngebotScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsScreen(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SoftwareScreen(),
        ));
        break;
    }
  }
}

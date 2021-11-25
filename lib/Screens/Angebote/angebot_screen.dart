import 'package:flutter/material.dart';
import 'package:it_security_app/Menues/Main_Menu/app_bar.dart';
import 'package:it_security_app/Menues/Main_Menu/navigation_drawer.dart';
import 'package:it_security_app/Screens/Angebote/components/angebot_body.dart';

class AngebotScreen extends StatefulWidget {
  const AngebotScreen({Key? key}) : super(key: key);

  @override
  _AngebotScreenState createState() => _AngebotScreenState();
}

class _AngebotScreenState extends State<AngebotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Angebote'),
        appBar: AppBar(),
      ),
      drawer: NavigationDrawerWidget(),
      body: AngebotBody(),
    );
  }
}

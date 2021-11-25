import 'package:flutter/material.dart';
import 'package:it_security_app/Menues/Main_Menu/app_bar.dart';
import 'package:it_security_app/Menues/Main_Menu/navigation_drawer.dart';
import 'package:it_security_app/Screens/Software/components/software_body.dart';

class SoftwareScreen extends StatefulWidget {
  const SoftwareScreen({Key? key}) : super(key: key);

  @override
  _SoftwareScreenState createState() => _SoftwareScreenState();
}

class _SoftwareScreenState extends State<SoftwareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Software'),
        appBar: AppBar(),
      ),
      drawer: NavigationDrawerWidget(),
      body: SoftwareBody(),
    );
  }
}

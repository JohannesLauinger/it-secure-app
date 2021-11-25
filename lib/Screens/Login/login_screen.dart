import 'package:flutter/material.dart';
import 'package:it_security_app/Menues/Main_Menu/app_bar.dart';
import 'package:it_security_app/Menues/Main_Menu/navigation_drawer.dart';
import 'components/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Login'),
        appBar: AppBar(),
      ),
      drawer: NavigationDrawerWidget(),
      body: LoginBody(),
    );
  }
}

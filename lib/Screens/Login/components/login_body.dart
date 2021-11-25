import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Login!'),
    );
  }
}

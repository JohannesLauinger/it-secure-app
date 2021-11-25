import 'package:flutter/material.dart';
import 'package:it_security_app/Menues/Main_Menu/app_bar.dart';
import 'package:it_security_app/Menues/Main_Menu/navigation_drawer.dart';
import 'components/quiz_body.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Quiz'),
        appBar: AppBar(),
      ),
      drawer: NavigationDrawerWidget(),
      body: QuizBody(),
    );
  }
}

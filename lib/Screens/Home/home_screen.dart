import 'package:flutter/material.dart';
import 'components/home_body.dart';
import '../../Menues/Main_Menu/navigation_drawer.dart';
import '../../Menues/Main_Menu/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Home'),
        appBar: AppBar(),
      ),
      drawer: NavigationDrawerWidget(),
      body: HomeBody(),
    );
  }
}

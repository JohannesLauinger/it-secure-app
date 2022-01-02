import 'package:flutter/material.dart';
import 'package:it_security_app/Menues/Main_Menu/app_bar.dart';
import 'package:it_security_app/Menues/Main_Menu/navigation_drawer.dart';
import 'package:it_security_app/Screens/Home/home_screen.dart';
import 'package:it_security_app/Screens/Kurse/components/kurs_dialog.dart';
import 'boxes.dart';
import 'components/kurse_body.dart';
import 'model/kurs.dart';

class KurseScreen extends StatefulWidget {
  const KurseScreen({Key? key}) : super(key: key);

  @override
  _KurseScreenState createState() => _KurseScreenState();
}

class _KurseScreenState extends State<KurseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Kurse'),
        appBar: AppBar(),
      ),
      drawer: NavigationDrawerWidget(),
      body: Kursebody(),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Color(0xFF1D2F6F),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => showDialog(
              context: context,
              builder: (context) => KursDialog(
                    onClickedDone: addKurs,
                  ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future addKurs(String name, int time, String category, String imagePath,
      String videoPath) async {
    final kurs = Kurs()
      ..name = name
      ..time = time
      ..category = category
      ..imagePath = imagePath
      ..videoPath = videoPath;

    final box = Boxes.getKurse();
    box.add(kurs);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }
}

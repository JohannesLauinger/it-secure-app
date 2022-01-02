import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:it_security_app/Menues/Main_Menu/app_bar.dart';
import 'package:it_security_app/Screens/Kurse/model/kurs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:it_security_app/Screens/Kurse/components/kurse_body.dart';

import 'kurs_dialog.dart';

class KursPage extends StatelessWidget {
  final Kurs kurs;

  KursPage({required this.kurs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: Text(kurs.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(kurs.imagePath), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  kurs.category,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                kurs.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Dauer: " + kurs.time.toString() + " min",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D2F6F),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Expanded(
                      child: TextButton.icon(
                        label: Text(
                          'Ändern',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => KursDialog(
                              kurs: kurs,
                              onClickedDone: (name, time, category, imagePath,
                                      videoPath) =>
                                  editKurs(kurs, name, time, category,
                                      imagePath, videoPath),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D2F6F),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Expanded(
                      child: TextButton.icon(
                        label: Text('Löschen',
                            style: TextStyle(color: Colors.white)),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () => deleteKurs(kurs),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildButtons(BuildContext context, Kurs kurs) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: Text('Ändern'),
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => KursDialog(
                    kurs: kurs,
                    onClickedDone: (name, time, category, imagePath,
                            videoPath) =>
                        editKurs(
                            kurs, name, time, category, imagePath, videoPath),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: Text('Löschen'),
              icon: Icon(Icons.delete),
              onPressed: () => deleteKurs(kurs),
            ),
          )
        ],
      );
  void editKurs(
    Kurs kurs,
    String name,
    int time,
    String category,
    String imagePath,
    String videoPath,
  ) {
    kurs.name = name;
    kurs.time = time;
    kurs.category = category;
    kurs.imagePath = imagePath;
    kurs.videoPath = videoPath;

    kurs.save();
  }

  void deleteKurs(Kurs kurs) {
    kurs.delete();
  }
}

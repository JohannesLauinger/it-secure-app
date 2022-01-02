import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:it_security_app/Screens/Kurse/components/kurs_info.dart';
import 'package:it_security_app/Screens/Kurse/components/search_widget.dart';
import 'package:it_security_app/Screens/Kurse/model/kurs.dart';
import '../boxes.dart';
import 'kurs_details.dart';

class Kursebody extends StatefulWidget {
  const Kursebody({Key? key}) : super(key: key);

  @override
  _KurseBodyState createState() => _KurseBodyState();
}

class _KurseBodyState extends State<Kursebody> {
  late List<Kurs> kurse;
  String query = '';

  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    kurse =
        Boxes.getKurse().values.where((kurs) => kurs.name.isNotEmpty).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text("Dein Programm",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1D2F6F),
                    fontWeight: FontWeight.w700,
                  )),
              Expanded(child: Container()),
              Text(
                "Filter",
                style: TextStyle(fontSize: 16, color: Color(0xFF1D2F6F)),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.filter_list,
                color: Color(0xFF1D2F6F),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF1D2F6F),
                  Color(0xFF7D92DE),
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(80)),
                boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.black38)]),
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nächste Lerneinheit",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Passwörter sicher verwalten",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer, size: 17, color: Colors.white),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "68 min",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 10,
                                  offset: Offset(2, 4))
                            ]),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoInfo()));
                          },
                          child: Icon(Icons.play_circle_fill,
                              color: Colors.white, size: 60),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                "Weitere Lerneinheiten",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1D2F6F)),
              )
            ],
          ),
          Expanded(
            child: Column(
              children: [buildSearch(), buildContent(kurse)],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Titel oder Kategorie',
        onChanged: searchKurs,
      );

  void searchKurs(String query) {
    final kurse = Boxes.getKurse()
        .values
        .where((kurs) =>
            kurs.name.toLowerCase().contains(query.toLowerCase()) ||
            kurs.category.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      this.query = query;
      this.kurse = kurse;
    });
  }

  Widget buildContent(List<Kurs> kurse) {
    if (kurse.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(top: 100),
        child: Text(
          "Keine Lerneinheiten vorhanden!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Expanded(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: kurse.length,
              itemBuilder: (BuildContext context, int index) {
                final kurs = kurse[index];

                return buildKurs(kurs);
              },
            ))
          ],
        ),
      );
    }
  }

  Widget buildKurs(
    Kurs kurs,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KursPage(
                      kurs: kurs,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ]),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )
          ],
        ),
      ),
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
  }
}

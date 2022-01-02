import 'package:flutter/material.dart';
import 'package:it_security_app/Screens/Kurse/kurse_screen.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF1D2F6F), Color(0xFF7D92DE)],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KurseScreen()));
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("Passwörter sicher verwalten",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Colors.white24, Colors.white30],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "68 min",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Colors.white24, Colors.white30],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Grundlagen",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Kapitel 1: Passwortverwaltung",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

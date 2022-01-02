import 'package:flutter/material.dart';
import 'package:it_security_app/Screens/Home/components/customListTile.dart';

class AngebotBody extends StatefulWidget {
  const AngebotBody({Key? key}) : super(key: key);

  @override
  _AngebotBodyState createState() => _AngebotBodyState();
}

class _AngebotBodyState extends State<AngebotBody> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                    image: AssetImage('assets/images/main_top.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                "15% Rabatt",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Kaspersky Internet Security 2021",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Container(
              height: 200.0,
              margin: EdgeInsets.all(5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.idealo.com/folder/Product/200690/1/200690189/s1_produktbild_gross/kaspersky-internet-security-2021-1-geraet-1-jahr-download.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                "15% Rabatt",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Kaspersky Internet Security 2021",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}

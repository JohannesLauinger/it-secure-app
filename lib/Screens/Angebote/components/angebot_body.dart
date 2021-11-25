import 'package:flutter/material.dart';

class AngebotBody extends StatefulWidget {
  const AngebotBody({Key? key}) : super(key: key);

  @override
  _AngebotBodyState createState() => _AngebotBodyState();
}

class _AngebotBodyState extends State<AngebotBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Angebote!'),
    );
  }
}

import 'package:flutter/material.dart';

class SoftwareBody extends StatefulWidget {
  const SoftwareBody({Key? key}) : super(key: key);

  @override
  _SoftwareBodyState createState() => _SoftwareBodyState();
}

class _SoftwareBodyState extends State<SoftwareBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Software!'),
    );
  }
}

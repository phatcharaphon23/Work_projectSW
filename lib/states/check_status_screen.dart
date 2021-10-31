import 'package:flutter/material.dart';
import 'package:ranya/utility/my_constant.dart';

class CheckStatusScreen extends StatefulWidget {
  const CheckStatusScreen({Key? key}) : super(key: key);

  @override
  _CheckStatusScreenState createState() => _CheckStatusScreenState();
}

class _CheckStatusScreenState extends State<CheckStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.primary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ranya/utility/my_constant.dart';

class PackagingScreen extends StatefulWidget {
  const PackagingScreen({Key? key}) : super(key: key);

  @override
  _PackagingScreenState createState() => _PackagingScreenState();
}

class _PackagingScreenState extends State<PackagingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Packaging',
      theme: ThemeData(primarySwatch: Colors.brown),
      color: Myconstant.dark,
    );
  }
}

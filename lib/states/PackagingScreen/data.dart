import 'package:flutter/material.dart';
import 'package:packing/utility/my_constant.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("ข้อมูลยา"),
      ),
    );
  }
}

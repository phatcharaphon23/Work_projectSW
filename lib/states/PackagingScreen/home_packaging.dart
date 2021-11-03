import 'package:flutter/material.dart';
import 'package:ranya/states/PackagingScreen/packaging_screen.dart';
import 'package:ranya/states/PackagingScreen/data.dart';

class PackagingHome extends StatefulWidget {
  PackagingHome({Key? key}) : super(key: key);

  @override
  _PackagingHomeState createState() => _PackagingHomeState();
}

class _PackagingHomeState extends State<PackagingHome> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: size * 0.8,
            child: Column(
              children: [
                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PackgingScreen(),
                      ),
                    )
                  },

                  // ignore: prefer__ructors
                  child: Text(
                    'เพิ่มข้อมูลยาลงกล่อง',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataPage(),
                      ),
                    )
                  },

                  // ignore: prefer__ructors
                  child: Text(
                    'ข้อมูลในกล่องยา',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

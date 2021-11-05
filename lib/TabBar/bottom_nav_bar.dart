import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:ranya/states/home.dart';
import 'package:ranya/states/Profile/profile.dart';
// import 'package:ranya/states/scanner_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNaItem(
            title: "Home",
            svgScr: "assets/icons/home2.png",
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          BottomNaItem(
            svgScr: "assets/icons/scan.png",
            title: "Scan",
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScannerScreen(),
                ),
              );
            },
            isActive: true,
          ),
          BottomNaItem(
              svgScr: "assets/icons/profile.png",
              title: "Profile",
              onpress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class BottomNaItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function()? onpress;
  final bool isActive;
  const BottomNaItem(
      {Key? key,
      required this.svgScr,
      required this.title,
      required this.onpress,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 30,
            child: Image.asset(
              svgScr,
              // color: isActive?
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ranya/TabBar/bottom_nav_bar.dart';
import 'package:ranya/states/history_screen.dart';
import 'package:ranya/states/information_screen.dart';
import 'package:ranya/states/packaging_screengg.dart';
import 'package:ranya/utility/my_constant.dart';

import 'check_status_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size * 0.8,
            decoration: BoxDecoration(
              color: Myconstant.dark,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    // ignore: prefer_const_constructors
                    child: Align(
                      alignment: Alignment.topRight,
                    ),
                  ),
                  //แต่งด้วยน่ะอันนี้
                  Text(
                    "Welcome Home!! ",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        color: Colors.white54),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "Search",
                        // ignore: prefer_const_constructors
                        icon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 25,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PackagingScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/export.png"),
                                const Text(
                                  "แพ็คกล่องยา",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HistoryScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/timetable.png"),
                                const Text(
                                  "ประวัติ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InformationScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/supplements.png"),
                                const Text(
                                  "ข้อมูลยา",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckStatusScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/test.png"),
                                const Text(
                                  "เช็คสถานะ",
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // CategoryCard(
                        //   title: "Packaging",
                        //   svgSrc: "assets/icons/export.png",
                        //   onpress: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const PackingScreen(),
                        //       ),
                        //     );
                        //   },
                        // ),
                        // CategoryCard(
                        //   title: "Information",
                        //   svgSrc: "assets/icons/supplements.png",
                        //   onpress: () {},
                        // ),
                        // CategoryCard(
                        //   title: "History",
                        //   svgSrc: "assets/icons/timetable.png",
                        //   onpress: () {},
                        // ),
                        // CategoryCard(
                        //   title: "แปะไว้ก่อน",
                        //   svgSrc: "assets/icons/test.png",
                        //   onpress: () {},
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

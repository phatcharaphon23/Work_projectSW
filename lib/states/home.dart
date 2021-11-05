import 'package:flutter/material.dart';
import 'package:packing/TabBar/bottom_nav_bar.dart';
import 'package:packing/states/PackagingScreen/home_packaging.dart';
import 'package:packing/states/history_screen.dart';
import 'package:packing/states/information_screen.dart';
import 'package:packing/utility/my_constant.dart';
import 'package:packing/models/historys.dart';


import 'check_status_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
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
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    // ignore: prefer__ructors
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
                    margin: EdgeInsets.symmetric(vertical: 40),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // ignore: prefer__ructors
                    child: TextField(
                      // ignore: prefer__ructors
                      decoration: InputDecoration(
                        hintText: "Search",
                        // ignore: prefer__ructors
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
                                builder: (context) => PackagingHome(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/export.png"),
                                Text(
                                  "แพ็คกล่องยา",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async{

                            List<History>? historys =  await History.getHistory();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HistoryScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/timetable.png"),
                                Text(
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
                                builder: (context) => InformationScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/supplements.png"),
                                Text(
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
                                builder: (context) => CheckStatusScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Image.asset("assets/icons/test.png"),
                                Text(
                                  "เช็คสถานะ",
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ),
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

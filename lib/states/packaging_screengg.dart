import 'package:flutter/material.dart';
import 'package:packing/utility/my_constant.dart';

class PackagingScreen extends StatefulWidget {
  const PackagingScreen({Key? key}) : super(key: key);

  @override
  _PackagingScreenState createState() => _PackagingScreenState();
}

class _PackagingScreenState extends State<PackagingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Myconstant.dark,
            // ignore: prefer_const_constructors
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),

            // leading: Icon(
            //   Icons.arrow_back,
            //   color: Colors.white,
            // ),
            // titleTextStyle: Myconstant().h2Style(),

            bottom: TabBar(
                labelColor: Myconstant.dark,
                unselectedLabelColor: Colors.white,
                indicator: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                tabs: const [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("ชื่อยา"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Lot"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("วันหมดอายุ"),
                    ),
                  ),
                ]),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.apps),
              Icon(Icons.ac_unit_outlined),
              Icon(Icons.app_blocking),
            ],
          ),
        ),
      ),
    );
  }

  DefaultTabController getTab() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Myconstant.dark,
          titleTextStyle: Myconstant().h2Style(),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Myconstant.primary,
              ),
              tabs: const [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("ชื่อยา"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Lot"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("วันหมดอายุ"),
                  ),
                ),
              ]),
        ),
        // ignore: prefer_const_constructors
        body: TabBarView(
          children: const [
            Icon(Icons.apps),
            Icon(Icons.ac_unit_outlined),
            Icon(Icons.app_blocking),
          ],
        ),
      ),
    );
  }
}

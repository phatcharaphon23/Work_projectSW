import 'package:flutter/material.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/utility/my_constant.dart';

// class HistoryScreen extends StatefulWidget {
//   final List<History>? historys;
//   HistoryScreen({
//     this.historys,
//   });
//   // const HistoryScreen({Key? key}) : super(key: key);

//   @override
//   _HistoryScreenState createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Myconstant.dark,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// // import 'package:packing/models/history.dart';
// // import 'package:packing/class/color_title.dart';

class HistoryScreen extends StatefulWidget {
  final List<History>? historys;
  HistoryScreen({
    this.historys,
  });

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<History> historys = [];

  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var history in historys) {
      var l = ListTile(
        title: Text("${history.productName}"),
        subtitle: Text(history.productModel!),
      );
      list.add(l);
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    historys = (widget.historys ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Container(
        child: ListView(
          children: getListTile(),
        ),
      ),
    );
  }
}

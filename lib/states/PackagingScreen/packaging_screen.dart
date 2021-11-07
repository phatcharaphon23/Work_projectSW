import 'package:flutter/material.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/states/information_screen.dart';
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
        trailing: Text(history.quantity!.toString()),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Details'),
              backgroundColor: Colors.white,
              content: SizedBox(
                width: 400.0,
                height: 100.0,
                child: Column(
                  children: [Text("เพิ่มลงกล่อง")],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Add'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InformationScreen(),
                      ),
                    )
                  },
                ),
                TextButton(
                    child: Text('Close'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        },
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
        title: Text("ข้อมูลยา"),
        backgroundColor: Myconstant.dark,
      ),
      body: Container(
        child: ListView(
          children: getListTile(),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:packing/models/customer.dart';
// import 'package:packing/class/color_title.dart';

// class CustomerScreen extends StatefulWidget {
//   final List<Customer>? customers;
//   CustomerScreen({
//     this.customers,
//   });

//   @override
//   _CustomerScreenState createState() => _CustomerScreenState();
// }

// class _CustomerScreenState extends State<CustomerScreen> {
//   List<Customer> customers = [];
//   Colorlist col = new Colorlist();
//   colorCheck(i) {
//     var check = i % 2;
//     var c = col.colortitle(check);
//     return c;
//   }

//   List<ListTile> getListTile() {
//     int i = 0;
//     List<ListTile> list = [];
//     for (var customer in customers) {
//       i++;
//       var l = ListTile(
//         title: Text("${customer.customerCode}  ${customer.customerName}"),
//         tileColor: colorCheck(i),
//         onTap: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) => AlertDialog(
//               title: Text('Details'),
//               backgroundColor: Colors.white,
//               content: SizedBox(
//                 width: 400.0,
//                 height: 100.0,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Flexible(
//                           child: Text(
//                             "${customer.customerCode}",
//                             style: TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Flexible(
//                           child: Text(
//                             "${customer.customerName}",
//                             style: TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                     child: Text('Close'),
//                     style: TextButton.styleFrom(
//                       primary: Colors.white,
//                       backgroundColor: Colors.blueGrey,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     }),
//               ],
//             ),
//           );
//         },
//       );
//       list.add(l);
//     }
//     return list;
//   }

//   @override
//   void initState() {
//     super.initState();
//     customers = (widget.customers ?? []).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Customer"),
//         backgroundColor: Colors.lightBlue[900],
//       ),
//       body: Container(
//         child: ListView(
//           children: getListTile(),
//         ),
//       ),
//     );
//   }
// }

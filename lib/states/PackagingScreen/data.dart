import 'package:flutter/material.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/utility/my_constant.dart';

class DataPage extends StatefulWidget {
  final List<History>? lot;
  DataPage({
    this.lot,
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<DataPage> {
  List<History> lot = [];
  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var lot in lot) {
      var l = ListTile(
        title: Text(lot.productLot!),
        trailing: Text(lot.status!),
        onTap: () {},
        // onTap: () {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) => AlertDialog(
        //       title: Text('Details'),
        //       backgroundColor: Colors.white,
        //       content: SizedBox(
        //         width: 400.0,
        //         height: 100.0,
        //         child: Column(
        //           children: [Text("เพิ่มลงกล่อง")],
        //         ),
        //       ),
        // actions: <Widget>[
        // TextButton(
        //   child: Text('Add'),
        //   style: TextButton.styleFrom(
        //     primary: Colors.white,
        //     backgroundColor: Colors.blueGrey,
        //   ),
        // onPressed: () => {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => InformationScreen(),
        //     ),
        //   )
        // },
        // ),
        //       TextButton(
        //           child: Text('Close'),
        //           style: TextButton.styleFrom(
        //             primary: Colors.white,
        //             backgroundColor: Colors.blueGrey,
        //           ),
        //           onPressed: () {
        //             Navigator.pop(context);
        //           }),
        //     ],
        //   ),
        // );
        // },
      );
      list.add(l);
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    lot = (widget.lot ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("ข้อมูลยา"),
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Details'),
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      width: 400.0,
                      height: 100.0,
                      child: Column(
                        children: [Text("สร้างกล่อง")],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                          child: Text('Add'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () async {
                            await History.addLot();
                            Navigator.pop(context);
                          }),
                      TextButton(
                          child: Text('Cancel'),
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
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        child: ListView(
          children: getListTile(),
          
        ),
      ),
    );
  }
}

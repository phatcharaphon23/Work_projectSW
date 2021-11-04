import 'dart:convert';

// import 'package:packing/models/user.dart';
import 'package:packing/services/networking.dart';

class History {
  final int? id;
  final String? history_no;
  
  History(
      {this.history_no,this.id});

  // static Future<List<History>?> getHistory(String username, String startDate, String endDate) async {
  //   NetworkHelper networkHelper = NetworkHelper('merge_packs', {
  //     'username': username,
  //   });

  //   print(username);
  //   List<History> Historys = [];
  //   print(Historys);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       History History = History(
  //           id: int.parse(t['id']),
  //           mergeNo: t['merge_no'],
  //           productCode: t['part_code'],
  //           mergestatus: t['merge_status'],
  //           labelNO: t['label_no'],
  //           productID: int.parse(t["product_id"]),
  //           productName: t['part_name'],
  //           mergeDate: t['merge_date'],
  //           isVisible: true,);  
  //       Historys.add(History);
  //     }
  //     return Historys;
  //   }
  //   return null;
  // }

  // static Future<List<History>?> getHistoryID(String username) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('merge_packs', {'username': username});

  //   List<History> Historys = [];
  //   print(Historys);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       History History = History(
  //         id: 1,
  //         mergeNo: t['merge_no'],
  //         productCode: t['part_code'],
  //         mergestatus: t['merge_status'],
  //         labelNO: t['label_no'],
  //       );
  //       Historys.add(History);
  //     }
  //     return Historys;
  //   }
  //   return null;
  // }

  // static Future<List<History>?> upStatusHistory(
  //     User user, int HistoryID, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_merge_packs', {});

  //   List<History> Historys = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'id': HistoryID.toString(),
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       History History = History(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       Historys.add(History);
  //     }
  //     return Historys;
  //   }
  // }

  // static Future<List<History>?> upStatusMerging(
  //     User user, String mergeNo, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_mergings', {});

  //   List<History> Historys = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'merge_no': mergeNo,
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       History History = History(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       Historys.add(History);
  //     }
  //     return Historys;
  //   }
  // }

  // static Future<History?> checkHistoryID(
  //     User user, int productID, int HistoryID) async {
  //   NetworkHelper networkHelper = NetworkHelper('check_merge_pack_id', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //     'id': HistoryID.toString(),
  //   }));
  //   print("loginuser");
  //   if (json != null && json['error'] == false) {
  //     Map u = json['merge_packs'];
  //     History History = History(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return History;
  //   }
  //   return null;
  // }

  // static Future<History?> addHistory(User user, int productID) async {
  //   NetworkHelper networkHelper = NetworkHelper('add_merge_pack', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //   }));
  //   if (json != null) {
  //     Map u = json;
  //     History History = History(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return History;
  //   }
  //   return null;
  // }

  // static Future<List<History>?> completeHistory(
  //     User user, List labels, int HistoryID) async {
  //   NetworkHelper networkHelper = NetworkHelper('complete_merge_pack', {});
  //   String data = "";
  //   for (String i in labels) {
  //     data += "#" + i;
  //   }

  //   List<History> Historys = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'labels': data,
  //     'merge_pack_id': HistoryID.toString()
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       History History = History(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //         productCode: t['part_code'],
  //       );
  //       Historys.add(History);
  //     }
  //     return Historys;
  //   }
  // }

   static Future<List<History>?> getHistorysID() async {
    NetworkHelper networkHelper =
        NetworkHelper('historys', {});

    List<History> historys = [];
    print(historys);
    var json = await networkHelper.getData();
    if (json != null && json['error'] == false) {
      for (Map t in json['historys']) {
        History history = History(
          id: int.parse(t['id']) ,
          history_no: t['history_no'],
        );
        historys.add(history);
      }
      return historys;
    }
    return null;
  }

  static Future<History?> addHistory(String formulaCode) async {
    NetworkHelper networkHelper = NetworkHelper('add_history', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'formular_code': formulaCode.toString(),
    }));
    if (json != null) {
      Map u = json;
      History history = History(
        id: int.parse(u['id']) ,
          // history_no: u['history_no'],
      );
      return history;
    }
    return null;
  }
}

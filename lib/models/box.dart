import 'dart:convert';
import 'package:packing/services/networking.dart';

class Box {
  final int? id;
  final String? formulaID;
  final String? productName;
  final String? productModel;
  final String? formulaCode;
  final int? quantity;
  final String? boxNo;
  final String? status;

  Box({
    this.formulaID,
    this.id,
    this.productName,
    this.productModel,
    this.formulaCode,
    this.quantity,
    this.boxNo,
    this.status,
  });

  static Future<List<Box>?> getBox() async {
    NetworkHelper networkHelper = NetworkHelper('boxs', {});

    List<Box> historys = [];
    var json = await networkHelper.getData();
    if (json != null && json['error'] == false) {
      for (Map t in json['boxs']) {
        Box history = Box(
          id: int.parse(t['id']),
          boxNo: t['box_no'],
          status: t['status'],
          quantity: int.parse(t['quantity'].toString()) ,
        );
        historys.add(history);
      }
      return historys;
    }
    return null;
  }

  // static Future<List<Box>?> getBoxID(String username) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('merge_packs', {'username': username});

  //   List<Box> Boxs = [];
  //   print(Boxs);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Box Box = Box(
  //         id: 1,
  //         mergeNo: t['merge_no'],
  //         productCode: t['part_code'],
  //         mergestatus: t['merge_status'],
  //         labelNO: t['label_no'],
  //       );
  //       Boxs.add(Box);
  //     }
  //     return Boxs;
  //   }
  //   return null;
  // }

  // static Future<List<Box>?> upStatusBox(
  //     User user, int BoxID, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_merge_packs', {});

  //   List<Box> Boxs = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'id': BoxID.toString(),
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Box Box = Box(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       Boxs.add(Box);
  //     }
  //     return Boxs;
  //   }
  // }

  // static Future<List<Box>?> upStatusMerging(
  //     User user, String mergeNo, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_mergings', {});

  //   List<Box> Boxs = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'merge_no': mergeNo,
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Box Box = Box(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       Boxs.add(Box);
  //     }
  //     return Boxs;
  //   }
  // }

  // static Future<Box?> checkBoxID(
  //     User user, int productID, int BoxID) async {
  //   NetworkHelper networkHelper = NetworkHelper('check_merge_pack_id', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //     'id': BoxID.toString(),
  //   }));
  //   print("loginuser");
  //   if (json != null && json['error'] == false) {
  //     Map u = json['merge_packs'];
  //     Box Box = Box(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return Box;
  //   }
  //   return null;
  // }

  // static Future<Box?> addBox(User user, int productID) async {
  //   NetworkHelper networkHelper = NetworkHelper('add_merge_pack', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //   }));
  //   if (json != null) {
  //     Map u = json;
  //     Box Box = Box(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return Box;
  //   }
  //   return null;
  // }

  // static Future<List<Box>?> completeBox(
  //     User user, List labels, int BoxID) async {
  //   NetworkHelper networkHelper = NetworkHelper('complete_merge_pack', {});
  //   String data = "";
  //   for (String i in labels) {
  //     data += "#" + i;
  //   }

  //   List<Box> Boxs = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'labels': data,
  //     'merge_pack_id': BoxID.toString()
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Box Box = Box(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //         productCode: t['part_code'],
  //       );
  //       Boxs.add(Box);
  //     }
  //     return Boxs;
  //   }
  // }

  //  static Future<List<Box>?> getBoxsID() async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('historys', {});

  //   List<Box> historys = [];
  //   print(historys);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['historys']) {
  //       Box history = Box(
  //         id: int.parse(t['id']) ,
  //         history_no: t['history_no'],
  //       );
  //       historys.add(history);
  //     }
  //     return historys;
  //   }
  //   return null;
  // }


  static Future<Box?> addBox() async {
    NetworkHelper networkHelper = NetworkHelper('add_box', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{}));
    if (json != null) {
      for (Map u in json['boxs']) {
        Box box = Box(
          id: int.parse(u['id']),
          // history_no: u['history_no'],
        );
        return box;
      }
    }
    return null;
  }

  static Future<Box?> addFormulaInBox(int id, int boxID, int historyID) async {
    NetworkHelper networkHelper = NetworkHelper('add_formula_in_box', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'formula_id': id.toString(),
      'box_id': boxID.toString(),
      'history_id': historyID.toString(),
    }));
    
  }

  static Future<Box?> confirmBox(int boxID) async {
    NetworkHelper networkHelper = NetworkHelper('confirm_box', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'box_id': boxID.toString(),
    }));
    
  }
}

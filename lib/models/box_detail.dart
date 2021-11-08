import 'dart:convert';
import 'package:packing/services/networking.dart';

class BoxDetail {
  final int? id;
  final String? formulaID;
  final String? productName;
  final String? productModel;
  final String? formulaCode;
  final int? quantity;
  final String? boxNo;
  final String? status;
  final String? dateExt;

  BoxDetail({
    this.formulaID,
    this.id,
    this.productName,
    this.productModel,
    this.formulaCode,
    this.quantity,
    this.boxNo,
    this.status,
    this.dateExt,
  });

  static Future<List<BoxDetail>?> getBoxDetail(int boxID) async {
    NetworkHelper networkHelper = NetworkHelper('box_details', {
      'box_id': boxID.toString(),
    });

    List<BoxDetail> historys = [];
    var json = await networkHelper.getData();
    if (json != null && json['error'] == false) {
      for (Map t in json['box_details']) {
        BoxDetail history = BoxDetail(
          id: int.parse(t['id']),
          boxNo: t['box_detail_no'],
          status: t['status'],
          quantity: int.parse(t['quantity'].toString()),
          productName: t['product_name'],
          productModel: t['product_model'],
          dateExt: t['date_ext'],
        );
        historys.add(history);
      }
      return historys;
    }
    return null;
  }

  // static Future<List<BoxDetail>?> getBoxDetailID(String username) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('merge_packs', {'username': username});

  //   List<BoxDetail> BoxDetails = [];
  //   print(BoxDetails);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       BoxDetail BoxDetail = BoxDetail(
  //         id: 1,
  //         mergeNo: t['merge_no'],
  //         productCode: t['part_code'],
  //         mergestatus: t['merge_status'],
  //         labelNO: t['label_no'],
  //       );
  //       BoxDetails.add(BoxDetail);
  //     }
  //     return BoxDetails;
  //   }
  //   return null;
  // }

  // static Future<List<BoxDetail>?> upStatusBoxDetail(
  //     User user, int BoxDetailID, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_merge_packs', {});

  //   List<BoxDetail> BoxDetails = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'id': BoxDetailID.toString(),
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       BoxDetail BoxDetail = BoxDetail(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       BoxDetails.add(BoxDetail);
  //     }
  //     return BoxDetails;
  //   }
  // }

  // static Future<List<BoxDetail>?> upStatusMerging(
  //     User user, String mergeNo, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_mergings', {});

  //   List<BoxDetail> BoxDetails = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'merge_no': mergeNo,
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       BoxDetail BoxDetail = BoxDetail(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       BoxDetails.add(BoxDetail);
  //     }
  //     return BoxDetails;
  //   }
  // }

  // static Future<BoxDetail?> checkBoxDetailID(
  //     User user, int productID, int BoxDetailID) async {
  //   NetworkHelper networkHelper = NetworkHelper('check_merge_pack_id', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //     'id': BoxDetailID.toString(),
  //   }));
  //   print("loginuser");
  //   if (json != null && json['error'] == false) {
  //     Map u = json['merge_packs'];
  //     BoxDetail BoxDetail = BoxDetail(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return BoxDetail;
  //   }
  //   return null;
  // }

  // static Future<BoxDetail?> addBoxDetail(User user, int productID) async {
  //   NetworkHelper networkHelper = NetworkHelper('add_merge_pack', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //   }));
  //   if (json != null) {
  //     Map u = json;
  //     BoxDetail BoxDetail = BoxDetail(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return BoxDetail;
  //   }
  //   return null;
  // }

  // static Future<List<BoxDetail>?> completeBoxDetail(
  //     User user, List labels, int BoxDetailID) async {
  //   NetworkHelper networkHelper = NetworkHelper('complete_merge_pack', {});
  //   String data = "";
  //   for (String i in labels) {
  //     data += "#" + i;
  //   }

  //   List<BoxDetail> BoxDetails = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'labels': data,
  //     'merge_pack_id': BoxDetailID.toString()
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       BoxDetail BoxDetail = BoxDetail(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //         productCode: t['part_code'],
  //       );
  //       BoxDetails.add(BoxDetail);
  //     }
  //     return BoxDetails;
  //   }
  // }

  //  static Future<List<BoxDetail>?> getBoxDetailsID() async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('historys', {});

  //   List<BoxDetail> historys = [];
  //   print(historys);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['historys']) {
  //       BoxDetail history = BoxDetail(
  //         id: int.parse(t['id']) ,
  //         history_no: t['history_no'],
  //       );
  //       historys.add(history);
  //     }
  //     return historys;
  //   }
  //   return null;
  // }

  static Future<BoxDetail?> addBoxDetail(
      int boxID, int lotID, int formulaID) async {
    NetworkHelper networkHelper = NetworkHelper('add_formula_in_box', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'box_id': boxID.toString(),
      'lot_id': lotID.toString(),
      'formula_id': formulaID.toString(),
    }));
    if (json != null) {
      for (Map u in json['box_details']) {
        BoxDetail box_detail = BoxDetail(
          id: int.parse(u['id']),
          // history_no: u['history_no'],
        );
        return box_detail;
      }
    }
    return null;
  }

  // static Future<BoxDetail?> addFormulaInBoxDetail(int id, int box_detailID, int historyID) async {
  //   NetworkHelper networkHelper = NetworkHelper('add_formula_in_box_detail', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'formula_id': id.toString(),
  //     'box_detail_id': box_detailID.toString(),
  //     'history_id': historyID.toString(),
  //   }));

  // }

  // static Future<BoxDetail?> confirmBoxDetail(int box_detailID) async {
  //   NetworkHelper networkHelper = NetworkHelper('confirm_box_detail', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'id': box_detailID.toString(),
  //   }));

  // }
}

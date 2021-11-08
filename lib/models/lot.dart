import 'dart:convert';
import 'package:packing/services/networking.dart';

class Lot {
  final int? id;
  final String? formulaID;
  final String? productName;
  final String? productModel;
  final String? formulaCode;
  final double? quantity;
  final String? productLot;
  final String? status;

  Lot({
    this.formulaID,
    this.id,
    this.productName,
    this.productModel,
    this.formulaCode,
    this.quantity,
    this.productLot,
    this.status,
  });

  static Future<List<Lot>?> getLot() async {
    NetworkHelper networkHelper = NetworkHelper('lots', {});

    List<Lot> historys = [];
    var json = await networkHelper.getData();
    if (json != null && json['error'] == false) {
      for (Map t in json['lots']) {
        Lot history = Lot(
          id: int.parse(t['id']),
          productLot: t['lot_no'],
          status: t['status'],
        );
        historys.add(history);
      }
      return historys;
    }
    return null;
  }

  // static Future<List<Lot>?> getLotID(String username) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('merge_packs', {'username': username});

  //   List<Lot> Lots = [];
  //   print(Lots);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Lot Lot = Lot(
  //         id: 1,
  //         mergeNo: t['merge_no'],
  //         productCode: t['part_code'],
  //         mergestatus: t['merge_status'],
  //         labelNO: t['label_no'],
  //       );
  //       Lots.add(Lot);
  //     }
  //     return Lots;
  //   }
  //   return null;
  // }

  // static Future<List<Lot>?> upStatusLot(
  //     User user, int LotID, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_merge_packs', {});

  //   List<Lot> Lots = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'id': LotID.toString(),
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Lot Lot = Lot(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       Lots.add(Lot);
  //     }
  //     return Lots;
  //   }
  // }

  // static Future<List<Lot>?> upStatusMerging(
  //     User user, String mergeNo, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_mergings', {});

  //   List<Lot> Lots = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'merge_no': mergeNo,
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Lot Lot = Lot(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       Lots.add(Lot);
  //     }
  //     return Lots;
  //   }
  // }

  // static Future<Lot?> checkLotID(
  //     User user, int productID, int LotID) async {
  //   NetworkHelper networkHelper = NetworkHelper('check_merge_pack_id', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //     'id': LotID.toString(),
  //   }));
  //   print("loginuser");
  //   if (json != null && json['error'] == false) {
  //     Map u = json['merge_packs'];
  //     Lot Lot = Lot(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return Lot;
  //   }
  //   return null;
  // }

  // static Future<Lot?> addLot(User user, int productID) async {
  //   NetworkHelper networkHelper = NetworkHelper('add_merge_pack', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //   }));
  //   if (json != null) {
  //     Map u = json;
  //     Lot Lot = Lot(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return Lot;
  //   }
  //   return null;
  // }

  // static Future<List<Lot>?> completeLot(
  //     User user, List labels, int LotID) async {
  //   NetworkHelper networkHelper = NetworkHelper('complete_merge_pack', {});
  //   String data = "";
  //   for (String i in labels) {
  //     data += "#" + i;
  //   }

  //   List<Lot> Lots = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'labels': data,
  //     'merge_pack_id': LotID.toString()
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       Lot Lot = Lot(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //         productCode: t['part_code'],
  //       );
  //       Lots.add(Lot);
  //     }
  //     return Lots;
  //   }
  // }

  //  static Future<List<Lot>?> getLotsID() async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('historys', {});

  //   List<Lot> historys = [];
  //   print(historys);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['historys']) {
  //       Lot history = Lot(
  //         id: int.parse(t['id']) ,
  //         history_no: t['history_no'],
  //       );
  //       historys.add(history);
  //     }
  //     return historys;
  //   }
  //   return null;
  // }


  static Future<Lot?> addLot() async {
    NetworkHelper networkHelper = NetworkHelper('add_lot', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{}));
    if (json != null) {
      for (Map u in json['lots']) {
        Lot lot = Lot(
          id: int.parse(u['id']),
          // history_no: u['history_no'],
        );
        return lot;
      }
    }
    return null;
  }

  static Future<Lot?> addFormulaInLot(int id, int lotID, int historyID) async {
    NetworkHelper networkHelper = NetworkHelper('add_formula_in_lot', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'formula_id': id.toString(),
      'lot_id': lotID.toString(),
      'history_id': historyID.toString(),
    }));
    
  }

  static Future<Lot?> confirmLot(int lotID) async {
    NetworkHelper networkHelper = NetworkHelper('confirm_lot', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'id': lotID.toString(),
    }));
    
  }
}

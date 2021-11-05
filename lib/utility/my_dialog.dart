import 'package:flutter/material.dart';
import 'package:ranya/utility/my_constant.dart';
import 'package:ranya/widgets/show_image.dart';
import 'package:ranya/widgets/show_title.dart';

class MyDialog {
  // Future<Null> alertLocationService(
  //     BuildContext context, String title, String message) async {}

  // ignore: prefer_void_to_null
  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImages(path: Myconstant.images2),
          title: ShowTitle(title: title, textStyle: Myconstant().h2Style()),
          subtitle:
              ShowTitle(title: message, textStyle: Myconstant().h3Style()),
        ),
        children: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      ),
    );
  }
}

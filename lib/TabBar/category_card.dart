import 'package:flutter/material.dart';
import 'package:packing/utility/my_constant.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function onpress;
  const CategoryCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Myconstant.primary,
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            }, //อันนี้ต้องมาแก้น่ะ
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Image.asset(svgSrc, cacheWidth: 100),
                  const Spacer(),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ranya/states/PackagingScreen/packaging_screen.dart';
import 'package:ranya/states/PackagingScreen/data.dart';
import 'package:ranya/utility/my_constant.dart';
import 'package:ranya/widgets/show_image.dart';
import 'package:ranya/widgets/show_title.dart';

class PackagingHome extends StatefulWidget {
  PackagingHome({Key? key}) : super(key: key);

  @override
  _PackagingHomeState createState() => _PackagingHomeState();
}

class _PackagingHomeState extends State<PackagingHome> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: size * 0.8,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    alignment: Alignment.center,
                    width: size * 0.8,
                    child: ShowImages(
                      path: Myconstant.images7,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: TextButton.icon(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PackgingScreen(),
                                    ),
                                  )
                                },
                                icon: Icon(
                                  Icons.add_business_sharp,
                                  color: Colors.purple,
                                ),
                                label: Text(
                                  'เพิ่มข้อมูลเข้าในกล่องยา',
                                  style: TextStyle(
                                      color: Myconstant.primary, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextButton.icon(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DataPage(),
                              ),
                            )
                          },
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  width: 0.5, color: Myconstant.primary)),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25)),
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 25))),
                          icon: Icon(
                            Icons.domain_verification_sharp,
                            color: Colors.purple,
                          ),
                          label: Text(
                            'ข้อมูลในกล่องยา',
                            style: TextStyle(
                                color: Myconstant.primary, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShowTitle(
                          title: 'ต้องการกลับสู่หน้าหลัก ?',
                          textStyle: Myconstant().h3BlackStyle(),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Myconstant.routeHome),
                          child: const Text(' กลับสู่หน้าหลัก '),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

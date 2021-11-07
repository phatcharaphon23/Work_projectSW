// ignore: file_names
import 'package:flutter/material.dart';
import 'package:packing/states/login.dart';
import 'package:packing/utility/my_constant.dart';
import 'package:packing/widgets/show_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0,
        backgroundColor: Myconstant.dark,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: ListView(children: [
            buildImages(size),
            buildLogInScreen(),
          ]),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  Row buildLogInScreen() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      // Container(
      //   margin: EdgeInsets.only(top: 50.0),
      //   alignment: Alignment.center,
      //   width: ,
      //   child: ShowImages(
      //     path: Myconstant.images7,
      //   ),
      // ),
      Container(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: const Text('กรุณาเข้าสู่ระบบก่อน'),
        ),
      ),
    ]);
  }

  Row buildImages(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.8,
          child: ShowImages(path: Myconstant.images3),
        ),
      ],
    );
  }
}

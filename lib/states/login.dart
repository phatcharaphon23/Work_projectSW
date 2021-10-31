import 'package:flutter/material.dart';
import 'package:ranya/utility/my_constant.dart';
import 'package:ranya/widgets/show_image.dart';
import 'package:ranya/widgets/show_title.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Login> {
  bool statusRedEye = true;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Myconstant.dark,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            children: [
              buildImages(size),
              buildAppName(),
              buildUser(size),
              buildPassword(size),
              buildLogin(size),
              buildCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Non Account ?',
          textStyle: Myconstant().h2Style(),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, Myconstant.routeCreateAccount),
          child: const Text('Creat Account '),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: size * 0.65,
          child: ElevatedButton(
            style: Myconstant().myButtonStyle(),
            onPressed: () {},
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: size * 0.65,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your user";
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3Style(),
              labelText: 'user :',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: Myconstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Myconstant.light),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Myconstant.light),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: size * 0.65,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your password";
              } else {}
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: Myconstant.dark,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: Myconstant.dark,
                      ),
              ),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Myconstant.dark,
              ),
              labelStyle: Myconstant().h3Style(),
              labelText: 'password :',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Myconstant.light),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Myconstant.light),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: Myconstant.appName,
          textStyle: Myconstant().h1Style(),
        ),
      ],
    );
  }

  Row buildImages(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImages(path: Myconstant.images1),
        ),
      ],
    );
  }
}
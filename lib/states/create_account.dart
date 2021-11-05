// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:packing/api/singup.dart';
import 'package:packing/states/login.dart';
import 'package:packing/utility/my_constant.dart';
import 'package:packing/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formkey = GlobalKey<FormState>();
  
  String name = "";
  String email = "";
  String phone = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('create new account'),
        backgroundColor: Myconstant.dark,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              // padding: EdgeInsets.all(20),
              children: [
                buildTitle("Let's get started !"),
                buildName(size),
                buildEmail(size),
                buildPhone(size),
                buildPassword(size),
                // buildConfirmPassword(size),
                buildCreateAccount(size),
                buildLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: size * 0.8,
          child: TextFormField(
            onChanged: (value) {
                    name = value;
                  },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please complete your name";
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3Style(),
              labelText: 'Name :',
              prefixIcon: Icon(
                Icons.manage_accounts_outlined,
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

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: size * 0.8,
          child: TextFormField(
          onChanged: (value) {
                    email = value;
                  },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3Style(),
              labelText: 'Email :',
              prefixIcon: Icon(
                Icons.mail_outline,
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

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: size * 0.8,
          child: TextFormField(
     onChanged: (value) {
                    phone = value;
                  },
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your phone number";
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3Style(),
              labelText: 'Phone :',
              prefixIcon: Icon(
                Icons.phone_android_outlined,
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
          width: size * 0.8,
          child: TextFormField(
          onChanged: (value) {
                    password = value;
                  },
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your password";
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: Myconstant().h3Style(),
              labelText: 'Password :',
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
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

  Row buildCreateAccount(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          width: size * 0.8,
          child: buildCreateNewAccount(),
        ),
      ],
    );
  }

  ElevatedButton buildCreateNewAccount() {
    return ElevatedButton(
      style: Myconstant().myButtonStyle(),
      onPressed: () async{
        var u = await User.checkLogin(name, email, phone,password);
        if (name == "") {
                        print("ERROR");
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text(''),
                                  backgroundColor: Colors.pink[50],
                                  content: Text(
                                    '  ERROR ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text('Close'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ));
                      } else if (email == "") {
                        print("ERROR");
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text(''),
                                  backgroundColor: Colors.pink[50],
                                  content: Text(
                                    '  ERROR ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text('Close'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ));
                      } else if (phone == "") {
                        print("ERROR");
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text(''),
                                  backgroundColor: Colors.pink[50],
                                  content: Text(
                                    '  ERROR ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text('Close'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ));
                      }else if(password == "") {
                        print("ERROR");
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text(''),
                                  backgroundColor: Colors.pink[50],
                                  content: Text(
                                    '  ERROR ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text('Close'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ));

                      }

                                
                      else {
                        print("เพิ่มเเล้ว");
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text(''),
                                  backgroundColor: Colors.pink[50],
                                  content: Text(
                                    '  สมัครเรียบร้อย ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text('Close'),
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          if (true) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login()));
                                          }
                                          ;
                                        }),
                                  ],
                                ));
                      }
          
        
      },
      child: const Text('Create Account'),
    );
  }

  // Future<Null> uploadInsertData() async {
  //   String name = nameController.text;
  //   String email = emailController.text;
  //   String phone = phoneController.text;
  //   String password = passwordController.text;

  //   // ignore: avoid_print
  //   print(
  //       '## name = $name,email = $email, phone = $phone, password = $password');
  // }

  Row buildLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Already have a account ?',
          textStyle: Myconstant().h2Style(),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, Myconstant.routeLogin),
          child: const Text('Login '),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ShowTitle(
        title: title,
        textStyle: const TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}

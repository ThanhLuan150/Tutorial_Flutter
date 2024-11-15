import 'package:flutter/material.dart';
import 'package:new_project/src/blocs/login_bloc.dart';
import 'package:new_project/src/resource/home_page.dart'  ;
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginBloc bloc = new LoginBloc();

  bool _showPass = false;

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffd8d8d8),
                ),
                child: const FlutterLogo(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text(
                'Hello\nWelcome Back',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: StreamBuilder(
                stream: bloc.userStream,
                builder : (context , snapshot) => TextField(
                controller: _userController,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'USERNAME',
                    errorText: snapshot.hasError ? snapshot.error as String? : null,
                  labelStyle: const TextStyle(
                    color: Color(0xff888888),
                    fontSize: 15,
                  ),
                ),
              ),
            )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: StreamBuilder (
                      stream : bloc.passStream,
                      builder : (context , snapshot) =>  
                      TextField(
                      controller: _passController,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                           errorText: snapshot.hasError ? snapshot.error as String? : null,
                        labelStyle: const TextStyle(
                          color: Color(0xff888888),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    )
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  onPressed: onSignInClicked,
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "NEW USER? SIGN UP",
                      style: TextStyle(fontSize: 15, color: Color(0xff888888)),
                    ),
                    Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 void onSignInClicked() {
    if (bloc.isValidInfo(_userController.text , _passController.text)) {
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }


  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}

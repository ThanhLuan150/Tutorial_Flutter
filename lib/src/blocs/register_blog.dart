import 'dart:async';
import 'package:new_project/src/validator/register_validations.dart';

class RegisterBloc {
  StreamController _emailController = new StreamController();
  StreamController _userController =new StreamController();
  SteamController _passControler = new SteamController();


  bool isInvalidRegisterInfo(String email,String username , String pass ){
    if(!RegisterValidations.isVali)
  }
}
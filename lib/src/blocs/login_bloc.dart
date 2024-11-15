import 'dart:async';
import 'package:new_project/src/validator/validations.dart';
class LoginBloc {
  StreamController  _userController = new StreamController();
  StreamController _passController =  new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username , String pass){
    if(!Validations.isValidUser(username)){
      _userController.sink.addError('Tài Khoản không hợp lệ');//sink la input dau vao
      return false;
    }
      _userController.sink.add("OKI");
    if(!Validations.isValidPass(pass)){
      _passController.sink.addError('Mat khau phai co 6 ky tu !');//sink la input dau vao
      return false;
    }
    _passController.sink.add("OKI");
    return true;
  }
  void dispose(){
    _userController.close();
    _passController.close();
  }
}
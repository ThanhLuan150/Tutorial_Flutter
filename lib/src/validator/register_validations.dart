class RegisterValidations{
  static bool isValidUser(String user){
    return user != null && user.length > 6 ;
  }
  static bool isValidPass(String pass){
    return pass != null && pass.length > 6;
  }
  static bool isValidEmail(String email){
    return email != null  && email.contains('@')
  }
}
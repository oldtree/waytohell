
String ScreenImage = "http://127.0.0.1:8081/onstart.jpg";

class LoginInfo {
  LoginInfo({this.username,this.password});
  String username;
  String password; 
  String string(){
    return this.username + this.password;
  }
}

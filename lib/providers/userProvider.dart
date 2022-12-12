import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  bool _admin = false;
  bool _login = false;
  String _username = "";
  double _points = 0;

  bool get getAdmin => _admin;
  bool get getLogin => _login;
  String get getUsername => _username;
  double get getPoints => _points;
  
  void saveAdmin(bool admin) {
    _admin = admin;
    notifyListeners();
  }

  void saveLogin(bool login) {
    _login = login;
    notifyListeners();
  }

  void saveUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void savePoints(double points) {
    _points = points;
    notifyListeners();
  }
}
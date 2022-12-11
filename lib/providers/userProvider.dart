import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  bool _admin = false;
  bool _login = false;
  bool _register = false;
  String _username = "";
  Map<String, double> _dataMap = {};
  double _plastik = 0;
  double _kaca = 0;
  double _kertas = 0;
  double _organik = 0;
  double _netEmission = 0;
  double _totalMass = 0;


  bool get getAdmin => _admin;
  bool get getLogin => _login;
  bool get getRegister => _register;
  String get getUsername => _username;
  double get getPlastik => _plastik;
  double get getKaca => _kaca;
  double get getKertas => _kertas;
  double get getOrganik => _organik;
  double get getNetEmission => _netEmission;
  double get getTotalMass => _totalMass;
  Map<String, double> get getDataMap => _dataMap;
  
  void saveAdmin(bool admin) {
    _admin = admin;
    notifyListeners();
  }

  void saveLogin(bool login) {
    _login = login;
    notifyListeners();
  }

  void saveRegister(bool register) {
    _register = register;
    notifyListeners();
  }

  void saveUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void saveDataMap(List<dynamic> data) {
    _plastik = data[0].toDouble();
    _kaca = data[1].toDouble();
    _kertas = data[2].toDouble();
    _organik = data[3].toDouble();
    _netEmission = data[4].toDouble();
    _totalMass = data[5].toDouble();
    
    _dataMap = {
      "Plastik": _plastik,
      "Kaca": _kaca,
      "Kertas": _kertas,
      "Organik": _organik,
    };


    notifyListeners();
  }
}
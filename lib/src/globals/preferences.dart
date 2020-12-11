
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences _prefInstance;

  Future<bool> persistAuthenticated(bool auth) async =>
      await _prefInstance.setBool(_isAuthenticated, auth);

  Future<bool> persistAddress(String addressJson) async {
    return await _prefInstance.setString(_address, addressJson);
  }

  Future persistNewUser(bool value) async {
    return await _prefInstance.setBool(_isNewUser, value);
  }

  Future<bool> persistRoleId(String roleId) async {
    return await _prefInstance.setString(_roleId, roleId);
  }

  Future<bool> persistOrderNumber(String orderNumber) async {
    return await _prefInstance.setString(_orderNumber, orderNumber);
  }


  Future<bool> removeCity() async {
    return await _prefInstance.remove(_city);
  }



  Future<bool> removeDistrict() async {
    return await _prefInstance.remove(_district);
  }

  bool get isNewUser => _prefInstance.getBool(_isNewUser) ?? true;

  bool get authenticated => _prefInstance.getBool(_isAuthenticated);

  String get address => _prefInstance.getString(_address);

  String get roleId =>
      _prefInstance.getString(_roleId) == null ? null : _prefInstance.getString(_roleId);



  String get orderNumber => _prefInstance.getString(_orderNumber);

  Future<bool> initToken() async {
    _prefInstance = await SharedPreferences.getInstance();
    return _prefInstance.containsKey(_token);
  }

  void clear() => _prefInstance.clear();

  Preferences._internal() {
//    SharedPreferences.getInstance().then((sharedPreferences) {
//      _prefInstance = sharedPreferences;
//    });
  }

  static final Preferences _preferences = Preferences._internal();

  factory Preferences() => _preferences;
}

final pref = Preferences();

const String _site = 'site';
const String _token = 'token';
const String _isAuthenticated = 'auth';
const String _address = 'address';
const String _isNewUser = 'new';
const String _roleId = 'role_id';
const String _city = 'city';
const String _district = 'district';
const String _orderNumber = 'order_number';

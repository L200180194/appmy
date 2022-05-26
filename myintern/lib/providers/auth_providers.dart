import 'package:flutter/material.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {required String name,
      required String notlp_user,
      required String alamat_user,
      required String email,
      required String password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name,
          notlp_user: notlp_user,
          alamat_user: alamat_user,
          email: email,
          password: password);
      _user = user;
      print(_user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      print(_user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout({required String token}) async {
    try {
      print('masuk provider');
      bool user = await AuthService().logout(token: token);
      return user;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void autoLogin() {}
}

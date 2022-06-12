import 'package:flutter/material.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  late dynamic data;

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
      required String password,
      required String kota_id,
      required String prodi_id,
      required String pendidikan_id,
      required String skill_id,
      required String path,
      required String fn}) async {
    try {
      data = await AuthService().register(
          name: name,
          notlp_user: notlp_user,
          alamat_user: alamat_user,
          email: email,
          password: password,
          kota_id: kota_id,
          pendidikan_id: pendidikan_id,
          prodi_id: prodi_id,
          skill_id: skill_id,
          fn: fn,
          path: path);
      // _user = user;
      print(data);
      print('provider berhasil');
      return true;
    } catch (e) {
      print('provider gagal');
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

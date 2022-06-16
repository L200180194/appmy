import 'package:flutter/material.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/services/auth_service.dart';
import 'package:myintern/services/profile_service.dart';

class ProfileProvider with ChangeNotifier {
  // late UserModel _user;
  late dynamic data;

  // UserModel get user => _user;
  // set user(UserModel user) {
  //   _user = user;
  //   notifyListeners();
  // }

  Future<bool> updateProfile(
      {required String name,
      required String notlp_user,
      required String alamat_user,
      required String kota_id,
      required String prodi_id,
      required String pendidikan_id,
      required String skill_id,
      required String path,
      required String token,
      required String fn}) async {
    try {
      data = await ProfileService().updateProfile(
          name: name,
          notlp_user: notlp_user,
          alamat_user: alamat_user,
          kota_id: kota_id,
          pendidikan_id: pendidikan_id,
          prodi_id: prodi_id,
          skill_id: skill_id,
          fn: fn,
          token: token,
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

  Future<bool> updateFoto({
    required String path,
    required String token,
  }) async {
    try {
      data = await ProfileService().updateFoto(token: token, path: path);
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

  Future<bool> gantiPassword({
    required String password,
    required String passwordNew,
    required String passwordVerif,
    required String token,
  }) async {
    try {
      data = await ProfileService().gantiPassword(
          password: password,
          newPassword: passwordNew,
          token: token,
          verifPassword: passwordVerif);
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
}

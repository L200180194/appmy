import 'package:flutter/material.dart';
import 'package:myintern/models/pendaftaran_model.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/services/auth_service.dart';
import 'package:myintern/services/pendaftaran_services.dart';
import 'package:myintern/services/profile_service.dart';

class PendaftaranProvider with ChangeNotifier {
  // late UserModel _user;
  late dynamic data;
  late List ip;
  List<PendaftaranModel> _posisis = [];
  List<PendaftaranModel> get posisis => _posisis;
  set posisis(List<PendaftaranModel> posisis) {
    _posisis = posisis;
    notifyListeners();
  }

  // UserModel get user => _user;
  // set user(UserModel user) {
  //   _user = user;
  //   notifyListeners();
  // }

  Future<bool> daftar({
    required String tglDaftar,
    required String userId,
    required String posisiMagangId,
    required String perusahaanId,
    required String keteranganDaftar,
    required String token,
  }) async {
    try {
      data = await PendaftaranService().daftar(
          tglDaftar: tglDaftar,
          userId: userId,
          posisiMagangId: posisiMagangId,
          token: token,
          perusahaanId: perusahaanId,
          keteranganDaftar: keteranganDaftar);

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

  Future<void> informasiDaftar({
    required String token,
  }) async {
    try {
      List<PendaftaranModel> posisis =
          await PendaftaranService().informasiDaftar(
        token: token,
      );
      _posisis = posisis;

      // _user = user;
      // print(data);
      print('provider berhasil');
    } catch (e) {
      print('provider gagal');
      print(e);
    }
  }
}

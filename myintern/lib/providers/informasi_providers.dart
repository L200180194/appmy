import 'package:flutter/cupertino.dart';
import 'package:myintern/models/kota_model.dart';
import 'package:myintern/models/posisi_model.dart';
import 'package:myintern/services/informasi_service.dart';
import 'package:myintern/services/posisi_service.dart';

class InformasiProviders with ChangeNotifier {
  late List _kotas = [];
  late List _pendidikans = [];
  late List _prodis = [];
  late List _skills = [];
  List get kotas => _kotas;
  List get pendidikans => _pendidikans;
  List get prodis => _prodis;
  List get skills => _skills;
  set kotas(List kotas) {
    _kotas = kotas;
    notifyListeners();
  }

  set pendidikans(List pendidikans) {
    _pendidikans = pendidikans;
    notifyListeners();
  }

  set prodis(List prodis) {
    _prodis = prodis;
    notifyListeners();
  }

  set skills(List skills) {
    _skills = skills;
    notifyListeners();
  }

  Future<bool> getKota() async {
    try {
      List kotas = await InformasiService().getKota();
      _kotas = kotas;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getPendidikan() async {
    try {
      List pendidikans = await InformasiService().getPendidikan();
      _pendidikans = pendidikans;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getProdi() async {
    try {
      List prodis = await InformasiService().getProdi();
      _prodis = prodis;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getSkill() async {
    try {
      List skills = await InformasiService().getSkill();
      _skills = skills;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:myintern/models/posisi_model.dart';
import 'package:myintern/services/posisi_service.dart';

class PosisiProvider with ChangeNotifier {
  List<PosisiModel> _posisis = [];
  List<PosisiModel> get posisis => _posisis;
  set posisis(List<PosisiModel> posisis) {
    _posisis = posisis;
    notifyListeners();
  }

  List<PosisiModel> _search = [];
  List<PosisiModel> get search => _search;
  set search(List<PosisiModel> search) {
    _search = search;
    notifyListeners();
  }

  Future<void> getPosisi() async {
    try {
      List<PosisiModel> posisis = await PosisiService().getPosisi();
      _posisis = posisis;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSearchPosisi({required String text}) async {
    try {
      List<PosisiModel> search =
          await PosisiService().getSearchPosisi(text: text);
      _search = search;
      print('Kondisi Berhasil');
    } catch (e) {
      print(e);
    }
  }
}

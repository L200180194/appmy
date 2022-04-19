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

  Future<void> getPosisi() async {
    try {
      List<PosisiModel> posisis = await PosisiService().getPosisi();
      _posisis = posisis;
    } catch (e) {
      print(e);
    }
  }
}

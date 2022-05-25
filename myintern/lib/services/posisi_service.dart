import 'dart:convert';

import 'package:myintern/models/posisi_model.dart';
import 'package:http/http.dart' as http;

class PosisiService {
  Future<List<PosisiModel>> getPosisi() async {
    // var urlallposisi =
    // Uri.parse('http://192.168.0.115:8000/api/posisimagang/api');
    var urlallposisi =
        Uri.parse('http://portofoliome.my.id/api/posisimagang/api');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(urlallposisi, headers: headers);
    // print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<PosisiModel> posisi = [];

      for (var item in data) {
        posisi.add(PosisiModel.fromJson(item));
      }

      return posisi;
    } else {
      throw Exception('Gagal get Posisi');
    }
  }
}

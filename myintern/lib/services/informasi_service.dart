import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:myintern/models/kota_model.dart';
import 'package:myintern/models/pendidikan_model.dart';
import 'package:myintern/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InformasiService {
  Future<List> getKota() async {
    var urlKota = Uri.parse('http://portofoliome.my.id/api/kota/all');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(urlKota, headers: headers);
    // print(response);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['kota'];
      List<KotaModel> kota = [];

      // for (var item in data) {
      //   kota.add(KotaModel.fromJson(item));
      // }
      // print(posisi);
      return data;
    } else {
      throw Exception('Gagal get Posisi');
    }
  }

  Future<List> getPendidikan() async {
    var urlPendidikan =
        Uri.parse('http://portofoliome.my.id/api/pendidikan/all');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(urlPendidikan, headers: headers);
    // print(response);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['pendidikan'];
      List<PendidikanModel> pendidikan = [];

      // for (var item in data) {
      //   kota.add(KotaModel.fromJson(item));
      // }
      // print(data);
      return data;
    } else {
      throw Exception('Gagal get Pendidikan');
    }
  }

  Future<List> getProdi() async {
    var urlProdi = Uri.parse('http://portofoliome.my.id/api/prodi/all');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(urlProdi, headers: headers);
    // print(response);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['prodi'];
      List<PendidikanModel> pendidikan = [];

      // for (var item in data) {
      //   kota.add(KotaModel.fromJson(item));
      // }
      // print(data);
      return data;
    } else {
      throw Exception('Gagal get Prodi');
    }
  }

  Future<List> getSkill() async {
    var urlSkill = Uri.parse('http://portofoliome.my.id/api/skill/all');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(urlSkill, headers: headers);
    // print(response);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['skill'];
      List<PendidikanModel> pendidikan = [];

      // for (var item in data) {
      //   kota.add(KotaModel.fromJson(item));
      // }
      // print(data);
      return data;
    } else {
      throw Exception('Gagal get Skill');
    }
  }
}

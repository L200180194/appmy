import 'package:http/http.dart' as http;
import 'package:myintern/models/pendaftaran_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PendaftaranService {
  Future<dynamic> daftar(
      {required String userId,
      required String posisiMagangId,
      required String token,
      required String perusahaanId,
      required String tglDaftar,
      required String keteranganDaftar}) async {
    // var url = '$baseUrl/register';
    // var urlDaftar = Uri.parse('http://192.168.0.115:8000/api/register');
    var urlDaftar = Uri.parse('http://portofoliome.my.id/api/pendaftaranuser');
    String tkn = 'Bearer $token';
    print(tkn);
    // var headers = {'Content-Type': 'application/json', 'Authorization': tkn};
    var body = jsonEncode({
      'tgl_daftar': tglDaftar,
      'user_id': userId,
      'posisi_magang_id': posisiMagangId,
      'perusahaan_id': perusahaanId,
      'status_daftar': 'Proses',
      'keterangan_daftar': keteranganDaftar,
    });
    print(body);

    var response = await http.post(urlDaftar,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': tkn
        },
        body: body);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // UserModel user = UserModel.fromJson(data['user']);
      // user.token = 'Bearer ' + data['access_token'];
      // setToken(data['access_token']);
      // print(data['access_token']);

      // String foto_user = data['user']['foto_user'];
      print(data);
      // print(data['user']['name']);
      return data;
    } else {
      throw Exception('Gagal Mendaftar');
    }
  }

  Future<List<PendaftaranModel>> informasiDaftar({
    required String token,
  }) async {
    // var url = '$baseUrl/register';
    // var urlDaftar = Uri.parse('http://192.168.0.115:8000/api/register');
    var urlDaftar =
        Uri.parse('http://portofoliome.my.id/api/informasipendaftar');
    String tkn = 'Bearer $token';
    print(tkn);
    // var headers = {'Content-Type': 'application/json', 'Authorization': tkn};

    var response = await http.post(
      urlDaftar,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': tkn
      },
    );
    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['pendaftaran'];
      print(data);
      List<PendaftaranModel> daftar = [];

      for (var item in data) {
        daftar.add(PendaftaranModel.fromJson(item));
      }
      print(daftar);
      // print(data['user']['name']);
      return daftar;
    } else {
      throw Exception('Gagal Mendapatkan Informasi daftar');
    }
  }
}

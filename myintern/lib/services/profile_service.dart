import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<dynamic> updateProfile(
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
    var urlUpdateProfile =
        Uri.parse('http://portofoliome.my.id/api/userupdate');
    // var headers = {'Accept': 'application/json'};
    Map<String, dynamic> body = {
      'name': name,
      'alamat_user': alamat_user,
      'notlp_user': notlp_user,
      'kota_id': kota_id,
      'pendidikan_id': pendidikan_id,
      'skill_id': skill_id,
      'prodi_id': prodi_id
    };
    // var body = jsonEncode({
    //   'name': name,
    //   'alamat_user': alamat_user,
    //   'notlp_user': notlp_user,
    //   'email': email,
    //   'password': password,
    // });
    var request = http.MultipartRequest('POST', urlUpdateProfile);
    // var cv = http.MultipartFile.fromBytes(
    //     'PDF', (await rootBundle.load(path)).buffer.asUint8List(),
    //     filename: fn);
    // request.headers.addAll(headers);
    // request.fields.addAll(body);
    request.fields['name'] = name;
    request.fields['notlp_user'] = notlp_user;
    request.fields['kota_id'] = kota_id;
    request.fields['prodi_id'] = prodi_id;
    request.fields['pendidikan_id'] = pendidikan_id;
    request.fields['skill_id'] = skill_id;
    request.fields['alamat_user'] = alamat_user;
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';
    if (fn == '' && path == '') {
      print('aa');
    } else {
      request.files.add(await http.MultipartFile.fromPath('cv_user', path));
    }
    var response = await request.send();
    // print(response);
    var respdata = await response.stream.toBytes();
    var result = String.fromCharCodes(respdata);
    // print(result);
    if (response.statusCode == 200) {
      var data = jsonDecode(result)['data'];
      final sp = await SharedPreferences.getInstance();
      sp.setInt('id', data['id']);
      sp.setString("name", data['name'].toString());
      sp.setString("alamat", data['alamat_user']);
      if (data['foto_user'] == null || data['foto_user'] == '') {
        sp.setString("foto", '');
      } else {
        sp.setString("foto", data['foto_user']);
      }
      sp.setString("cv", data['cv_user']);
      sp.setString("notlp", data['notlp_user']);
      sp.setString('email', data['email']);
      sp.setString('skill', data['skill']['nama_skill']);
      sp.setInt('skill_id', data['skill']['id']);
      sp.setString('prodi', data['prodi']['nama_prodi']);
      sp.setInt('prodi_id', data['prodi']['id']);
      sp.setString('kota', data['kota']['nama_kota']);
      sp.setInt('kota_id', data['kota']['id']);
      sp.setString('pendidikan', data['pendidikan']['tingkat_pendidikan']);
      sp.setInt('pendidikan_id', data['pendidikan']['id']);
      print(data);
      return true;
    } else {
      var http;
      var resp = await http.Response.fromStream(response);
      var respData = jsonDecode(resp.body);
      // var data = jsonDecode(result)['meta'];
      print(respData);
      throw Exception('Gagal Register');
    }

    // var response = await http.post(urlregist, headers: headers, body: body);
    // print(response.body);
    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body)['data'];
    //   // UserModel user = UserModel.fromJson(data['user']);
    //   // user.token = 'Bearer ' + data['access_token'];
    //   print('service berhasil');
    //   return data;
    // } else {
    //   throw Exception('Gagal Register');
    // }
    // return false;
  }

  Future<dynamic> updateFoto(
      {required String token, required String path}) async {
    var urlupdate = Uri.parse("http://portofoliome.my.id/api/userupdatefoto");
    var request = http.MultipartRequest('POST', urlupdate);
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(await http.MultipartFile.fromPath('foto_user', path));
    var response = await request.send();
    var respdata = await response.stream.toBytes();
    var result = String.fromCharCodes(respdata);
    if (response.statusCode == 200) {
      var data = jsonDecode(result)['data'];
      final sp = await SharedPreferences.getInstance();
      sp.setString("foto", data['foto_user']);
      print(data);
      return true;
    } else {
      var http;
      var resp = await http.Response.fromStream(response);
      var respData = jsonDecode(resp.body);
      // var data = jsonDecode(result)['meta'];
      print(respData);
      throw Exception('Gagal Update foto');
    }
  }

  Future<dynamic> gantiPassword(
      {required String password,
      required String newPassword,
      required String token,
      required String verifPassword}) async {
    // var url = '$baseUrl/register';
    // var urlregist = Uri.parse('http://192.168.0.115:8000/api/register');
    var urlregist = Uri.parse('http://portofoliome.my.id/api/gantipass');
    String tkn = 'Bearer $token';
    print(tkn);
    var headers = {'Content-Type': 'application/json', 'Authorization': tkn};
    var body = jsonEncode({
      'password': password,
      'passwordbaru': newPassword,
      'passwordbaru_confirmation': verifPassword,
    });

    var response = await http.post(urlregist,
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
      throw Exception('Gagal Mengubah Password');
    }
  }
}

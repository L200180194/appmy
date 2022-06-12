import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:myintern/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // String baseUrl = 'http://127.0.0.1:8000/api';

  Future<dynamic> register(
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
    // var url = '$baseUrl/register';
    // var urlregist = Uri.parse('http://127.0.0.1:8000/api/register');
    // var stream = new http.ByteStream(file.openRead());
    var urlregist = Uri.parse('http://portofoliome.my.id/api/register');
    var headers = {'Accept': 'application/json'};
    Map<String, String> body = {
      'name': name,
      'alamat_user': alamat_user,
      'notlp_user': notlp_user,
      'email': email,
      'password': password,
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
    var request = http.MultipartRequest('POST', urlregist);
    // var cv = http.MultipartFile.fromBytes(
    //     'PDF', (await rootBundle.load(path)).buffer.asUint8List(),
    //     filename: fn);
    // request.headers.addAll(headers);
    // request.fields.addAll(body);
    request.fields['name'] = name;
    request.fields['notlp_user'] = notlp_user;
    request.fields['alamat_user'] = alamat_user;
    request.fields['password'] = password;
    request.fields['email'] = email;
    request.fields['kota_id'] = kota_id;
    request.fields['prodi_id'] = prodi_id;
    request.fields['pendidikan_id'] = pendidikan_id;
    request.fields['skill_id'] = skill_id;
    request.files.add(await http.MultipartFile.fromPath('cv_user', path));
    var response = await request.send();
    // print(response);
    if (response.statusCode == 200) {
      var respdata = await response.stream.toBytes();
      var result = String.fromCharCodes(respdata);
      print(result);
      var data = jsonDecode(result)['meta'];
      return true;
    } else {
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

  Future<bool> logout({required String token}) async {
    // var url = '$baseUrl/register';
    // var urlregist = Uri.parse('http://127.0.0.1:8000/api/register');
    var urllogout = Uri.parse('http://portofoliome.my.id/api/logout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    print('ini token');
    print(token);
    var response = await http.post(urllogout, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['meta'];
      // dynamic msg = data['msg'];
      // print(data);
      return true;
    } else {
      throw Exception('Gagal logout');
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    // var url = '$baseUrl/register';
    // var urlregist = Uri.parse('http://192.168.0.115:8000/api/register');
    var urlregist = Uri.parse('http://portofoliome.my.id/api/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(urlregist, headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      setToken(data['access_token']);
      print(data['access_token']);
      if (data['user']['foto_user'] == null ||
          data['user']['foto_user'] == '') {
        print('null');
      } else {
        print('tidak null');
      }

      // print(data['user']['name']);
      final sp = await SharedPreferences.getInstance();
      sp.setInt('id', data['user']['id']);
      sp.setString("name", data['user']['name'].toString());
      sp.setString("alamat", data['user']['alamat_user']);
      sp.setString("foto", data['user']['foto_user']);
      sp.setString("cv", data['user']['cv_user']);
      sp.setString("notlp", data['user']['notlp_user']);
      sp.setString('email', data['user']['email']);
      sp.setString('token', data['access_token']);
      sp.setString('skill', data['user']['skill']['nama_skill']);
      sp.setString('prodi', data['user']['prodi']['nama_prodi']);
      sp.setString('kota', data['user']['kota']['nama_kota']);
      sp.setString(
          'pendidikan', data['user']['pendidikan']['tingkat_pendidikan']);
      var em = sp.getString('name');

      print(em);
      // print(data['user']['pendidikan']['tingkat_pendidikan']);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}

setToken(tkn) async {
  SharedPreferences token = await SharedPreferences.getInstance();
  await token.setString('token', tkn);
}

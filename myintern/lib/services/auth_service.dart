import 'dart:convert';

import 'package:myintern/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // String baseUrl = 'http://127.0.0.1:8000/api';

  Future<UserModel> register(
      {required String name,
      required String notlp_user,
      required String alamat_user,
      required String email,
      required String password}) async {
    // var url = '$baseUrl/register';
    // var urlregist = Uri.parse('http://127.0.0.1:8000/api/register');
    var urlregist = Uri.parse('http://portofoliome.my.id/api/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'alamat_user': alamat_user,
      'notlp_user': notlp_user,
      'email': email,
      'password': password,
    });

    var response = await http.post(urlregist, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Gagal Register');
    }
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
      throw Exception('Gagal Register');
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
    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      setToken(data['access_token']);
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

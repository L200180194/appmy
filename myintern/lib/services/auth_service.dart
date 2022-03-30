import 'dart:convert';

import 'package:myintern/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://127.0.0.1:8000/api';
  Future<UserModel> register(
      {required String name,
      required String notlp_user,
      required String alamat_user,
      required String email,
      required String password}) async {
    var url = '$baseUrl/register';
    // var urlregist = Uri.parse('http://127.0.0.1:8000/api/register');
    var urlregist = Uri.parse('http://10.0.2.2:8000/api/register');
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
}

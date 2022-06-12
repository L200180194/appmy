import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myintern/providers/informasi_providers.dart';
import 'package:myintern/providers/posisi_provider.dart';
import 'package:myintern/theme.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  late String tkn;

  Future<String> getSession() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token') ?? '';
    setState(() {
      tkn = token;
    });
    return token;
  }

  // Future<List> getKota() async {
  //   var urlKota = Uri.parse('http://portofoliome.my.id/api/kota/all');
  //   var headers = {'Content-Type': 'application/json'};
  //   var response = await http.get(urlKota, headers: headers);
  //   print(response);
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = jsonDecode(response.body)['data']['kota'];

  //     // for (var item in data) {
  //     //   posisi.add(KotaModel.fromJson(item));
  //     // }
  //     print(data);
  //     return data;
  //   } else {
  //     throw Exception('Gagal get Posisi');
  //   }
  // }

  getInit() async {
    // getKota();
    getSession().then((value) {
      print(value);
      if (value != '') {
        Timer(Duration(seconds: 1),
            () => Navigator.popAndPushNamed(context, '/home'));
      } else if (value == '') {
        Timer(Duration(seconds: 1),
            () => Navigator.popAndPushNamed(context, '/signin'));
      }
    });
    // if (tkn == null) {}

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          width: 202,
          height: 155,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/myintern.png'))),
        ),
      ),
    );
  }
}

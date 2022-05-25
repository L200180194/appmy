import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myintern/providers/posisi_provider.dart';
import 'package:myintern/theme.dart';
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

  Future<String> getSession() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    return token;
  }

  getInit() async {
    getSession().then((value) {
      if (value != null || value != '') {
        Timer(Duration(seconds: 1),
            () => Navigator.popAndPushNamed(context, '/home'));
      } else {
        Timer(Duration(seconds: 1),
            () => Navigator.popAndPushNamed(context, '/signin'));
      }
    });

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

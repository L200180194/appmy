import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myintern/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () => Navigator.pushNamed(context, '/signin'));
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

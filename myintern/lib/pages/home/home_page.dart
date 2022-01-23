import 'package:flutter/material.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Text('Home Page'),
        // Image.asset('assets/tokopedia.png'),
        PosisiCard(),
      ],
    );
  }
}

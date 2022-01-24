import 'package:flutter/material.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? ListView(
            children: [
              // Text('Home Page'),
              // Image.asset('assets/tokopedia.png'),
              PosisiCard(),
            ],
          )
        : ListView(
            children: [
              // Text('Home Page'),
              // Image.asset('assets/tokopedia.png'),
              PosisiCardLandscape()
            ],
          );
  }
}

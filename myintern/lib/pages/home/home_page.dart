import 'package:flutter/material.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? ListView(
            children: [
              // Image.asset('assets/tokopedia.png'),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
              PosisiCard(),
            ],
          )
        : ListView(
            children: [
              // Text('Home Page'),
              // Image.asset('assets/tokopedia.png'),

              PosisiCardLandscape(),
            ],
          );
  }
}

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/providers/posisi_provider.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<PosisiProvider>(context, listen: false).getPosisi();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    PosisiProvider pp = Provider.of<PosisiProvider>(context);
    // AuthProvider ap = Provider.of<AuthProvider>(context);
    // UserModel usr = ap.user;

    return (isLoading == true)
        ? Container(
            child: SpinKitRing(
              color: Colors.blue,
              size: 50.0,
            ),
          )
        : (MediaQuery.of(context).orientation == Orientation.portrait)
            ? ListView(
                children:
                    pp.posisis.map((posisi) => PosisiCard(posisi)).toList())
            : ListView(
                children: [
                  // Text('Home Page'),
                  // Image.asset('assets/tokopedia.png'),

                  PosisiCardLandscape(),
                ],
              );
  }
}

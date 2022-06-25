import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/pages/widget/informasi_card.dart';
import 'package:myintern/pages/widget/informasi_card_landscape.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/providers/informasi_providers.dart';
import 'package:myintern/providers/pendaftaran_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  bool isLoading = true;
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    final sp = await SharedPreferences.getInstance();
    // setState(() {
    //   id = sp.getInt('id')!.toInt();
    //   token = sp.getString('token').toString();

    //   // print(name);
    // });
    await Provider.of<PendaftaranProvider>(context, listen: false)
        .informasiDaftar(token: sp.getString('token').toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    PendaftaranProvider pp = Provider.of<PendaftaranProvider>(context);
    // print(pp);
    // AuthProvider ap = Provider.of<AuthProvider>(context);
    // UserModel usr = ap.user;
    if (pp.posisis.isEmpty) {
      print('kosong');
    } else {
      print('tidak kosong');
    }
    Widget informasi() {
      return Container(
          height: 105.h,
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(3.0, 3.0), //(x,y)
                  blurRadius: 7.0,
                ),
              ]),
          child: Column(
            children: [
              // Image.asset('infopage1.png'),
              Text(
                'Halaman informasi merupakan halaman berisi daftar posisi yang sudah didaftari oleh peserta. Pegumuman pendaftaran juga dapat dilihat di halaman informasi ini',
                style: primaryTextStyle.copyWith(fontSize: 14.sp),
              ),
            ],
          ));
    }

    return (isLoading == true)
        ? Container(
            child: SpinKitRing(
              color: Colors.blue,
              size: 50.0,
            ),
          )
        : (pp.posisis.isEmpty)
            ? informasi()
            : (MediaQuery.of(context).orientation == Orientation.portrait)
                ? ListView(
                    children: pp.posisis.map((e) => InformasiCard(e)).toList())
                : ListView(
                    children: pp.posisis
                        .map((e) => InformasiCardLandscape(e))
                        .toList());
  }
}

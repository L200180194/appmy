import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/pages/widget/informasi_card.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/providers/informasi_providers.dart';
import 'package:myintern/providers/pendaftaran_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    // [Text('')])
                    pp.posisis.map((e) => InformasiCard(e)).toList())
            : ListView(
                children: [
                  // Text('Home Page'),
                  // Image.asset('assets/tokopedia.png'),

                  PosisiCardLandscape(),
                ],
              );
  }
}

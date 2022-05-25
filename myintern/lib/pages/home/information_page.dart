import 'package:flutter/material.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthProvider ap = Provider.of<AuthProvider>(context);
    // UserModel usr = ap.user;
    // print(usr.token);
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? ListView(
            children: [
              // Text('Home Page'),
              // Image.asset('assets/tokopedia.png'),
              // PosisiCard(),
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

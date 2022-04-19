import 'package:flutter/material.dart';
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
  @override
  bool isLoading = false;
  Widget build(BuildContext context) {
    PosisiProvider pp = Provider.of<PosisiProvider>(context);

    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? ListView(
            children: pp.posisis.map((posisi) => PosisiCard(posisi)).toList())
        : ListView(
            children: [
              // Text('Home Page'),
              // Image.asset('assets/tokopedia.png'),

              PosisiCardLandscape(),
            ],
          );
  }
}

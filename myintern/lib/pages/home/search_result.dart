import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';
import 'package:myintern/providers/posisi_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class SearchResultPage extends StatefulWidget {
  final String src;
  SearchResultPage({Key? key, required this.src}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState(src);
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool isLoading = true;

  String src;
  _SearchResultPageState(this.src);
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<PosisiProvider>(context, listen: false)
        .getSearchPosisi(text: src);
    setState(() {
      isLoading = false;
    });
  }

  @override
  TextEditingController SearchCntroller = TextEditingController(text: '');

  Widget build(BuildContext context) {
    PosisiProvider pp = Provider.of<PosisiProvider>(context);
    Widget banner() {
      var sp;
      return Container(
          height: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? 28.h
              : 50.h,
          margin: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigator.popAndPushNamed(context, '/home');
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded)))),
              Center(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Cari',
                  style: primaryTextStyle.copyWith(
                      fontWeight: bold, fontSize: 18.sp),
                ),
              )),
              Expanded(flex: 2, child: Container())
            ],
          )
          // Center(
          //     child: FittedBox(
          //   fit: BoxFit.scaleDown,
          //   child: Text(
          //     'Pendaftaran',
          //     style:
          //         primaryTextStyle.copyWith(fontWeight: bold, fontSize: 18.sp),
          //   ),
          // ))
          );
    }

    Widget informasi() {
      return ListView(
        children: [
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/search_not_found.png',
                    // width: 250.w,
                    // height: 250.h,
                  ),
                  Text(
                    'Hasil pencarian dari $src tidak ditemukan',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle.copyWith(fontSize: 20.sp),
                  ),
                ],
              )),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight:
            (MediaQuery.of(context).orientation == Orientation.portrait)
                ? 48.h
                : 48,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        )),
        leading: SizedBox(
          child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.popAndPushNamed(context, '/home');
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded))),
        ),
        title: Text(
          'Hasil pencarian $src',
          style: primaryTextStyle.copyWith(
              color: Colors.black, fontWeight: bold, fontSize: 16.sp),
        ),
        actions: [SizedBox()],
        backgroundColor: Colors.white,
      ),
      body: ColorfulSafeArea(
          color: primaryColor,
          child: (isLoading == true)
              ? Container(
                  child: SpinKitRing(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                )
              : (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? (pp.search.isEmpty)
                      ? informasi()
                      : ListView(
                          children:
                              pp.search.map((e) => PosisiCard(e)).toList())
                  : (pp.search.isEmpty)
                      ? informasi()
                      : ListView(
                          children: pp.search
                              .map((e) => PosisiCardLandscape(e))
                              .toList())),
    );
  }
}

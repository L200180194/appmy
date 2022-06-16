import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:myintern/models/posisi_model.dart';
import 'package:myintern/pages/home/daftar_magang.dart';
import 'package:myintern/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/link.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({
  //   Key? key,
  //   required this.posisi,
  // }) : super(key: key);
  final PosisiModel posisi;
  const DetailPage({
    Key? key,
    required this.posisi,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Future getToken() async {
  //   SharedPreferences token = await SharedPreferences.getInstance();
  //   return token.getString('token');
  // }
  // Future<void>? _launched;
  // Future<void> _launchInBrowser(String url) async {
  //   print(url);
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: false,
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  SharedPreferences? pr;

  @override
  Widget build(BuildContext context) {
    Widget banner() {
      return Container(
          // color: Colors.green,
          height: 28.h,
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
              Container(),
              Expanded(flex: 2, child: Container())
            ],
          ));
    }

    print(widget.posisi.perusahaan!.id);
    Widget photo() {
      return Container(
        // color: Colors.red,
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150.h,
              width: 150.h,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 14.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0.0, 0.0), //(x,y)
                        blurRadius: 7.0,
                        spreadRadius: 3),
                  ]),
              child: Image.network(
                  'http://portofoliome.my.id/storage/${widget.posisi.foto_posisi}'),
            ),
            Center(
              child: Text(
                '${widget.posisi.nama_posisi}',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 18.sp, fontWeight: bold),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Center(
              child: Text(
                '${widget.posisi.perusahaan!.alamat_perusahaan}',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 12.sp, fontWeight: regular),
              ),
            ),
          ],
        ),
      );
    }

    Widget deskripsi() {
      return Container(
        padding: EdgeInsets.all(12.sp),
        margin: EdgeInsets.fromLTRB(defaultMargin, 12.h, defaultMargin, 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 0.0), //(x,y)
                  blurRadius: 7.0,
                  spreadRadius: 3),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi ',
              textAlign: TextAlign.start,
              style:
                  primaryTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            // HtmlWidget(
            //   '${widget.posisi.deskripsi_posisi}',
            //   textStyle: primaryTextStyle.copyWith(
            //       fontSize: 12.sp, fontWeight: regular),
            //   customStylesBuilder: (element) {
            //     // if (element.classes.contains('foo')) {
            //     return {'text-align': 'justify'};
            //     // }

            //     // return null;
            //   },
            //   // onTapUrl: (url) => setState(() {
            //   //   _launched = _launchInBrowser(url);
            //   // }),
            // ),
            Text(
              '${widget.posisi.deskripsi_posisi}',
              textAlign: TextAlign.justify,
              style: primaryTextStyle.copyWith(
                  fontSize: 12.sp, fontWeight: regular),
            ),
          ],
        ),
      );
    }

    Widget persyaratan() {
      return Container(
        padding: EdgeInsets.all(12.sp),
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 0.0), //(x,y)
                  blurRadius: 7.0,
                  spreadRadius: 3),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Persyaratan',
              textAlign: TextAlign.start,
              style:
                  primaryTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            // HtmlWidget(
            //   '${widget.posisi.persyaratan_posisi}',
            //   textStyle: primaryTextStyle.copyWith(
            //       fontSize: 12.sp, fontWeight: regular),
            //   customStylesBuilder: (element) {
            //     // if (element.classes.contains('foo')) {
            //     return {'text-align': 'justify'};
            //     // }

            //     // return null;
            //   },
            // ),
            Text(
              '${widget.posisi.persyaratan_posisi}',
              textAlign: TextAlign.justify,
              style: primaryTextStyle.copyWith(
                  fontSize: 12.sp, fontWeight: regular),
            ),
          ],
        ),
      );
    }

    Widget fasilitas() {
      return Container(
        padding: EdgeInsets.all(12.sp),
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 0.0), //(x,y)
                  blurRadius: 7.0,
                  spreadRadius: 3),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fasilitas ',
              textAlign: TextAlign.start,
              style:
                  primaryTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            // HtmlWidget(
            //   '${widget.posisi.fasilitas_posisi}',
            //   textStyle: primaryTextStyle.copyWith(
            //       fontSize: 12.sp, fontWeight: regular),
            //   customStylesBuilder: (element) {
            //     // if (element.classes.contains('foo')) {
            //     return {'text-align': 'justify'};
            //     // }

            //     // return null;
            //   },
            // ),
            Text(
              '${widget.posisi.fasilitas_posisi}',
              textAlign: TextAlign.justify,
              style: primaryTextStyle.copyWith(
                  fontSize: 12.sp, fontWeight: regular),
            ),
          ],
        ),
      );
    }

    Widget keterangan() {
      return Container(
        padding: EdgeInsets.all(12.sp),
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 0.0), //(x,y)
                  blurRadius: 7.0,
                  spreadRadius: 3),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keterangan ',
              textAlign: TextAlign.start,
              style:
                  primaryTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            // HtmlWidget(
            //   '${widget.posisi.keterangan_posisi}',
            //   textStyle: primaryTextStyle.copyWith(
            //       fontSize: 12.sp, fontWeight: regular),
            //   customStylesBuilder: (element) {
            //     // if (element.classes.contains('foo')) {
            //     return {'text-align': 'justify'};
            //     // }

            //     // return null;
            //   },
            // ),
            Text(
              '${widget.posisi.keterangan_posisi}',
              // '${this.pr?.getString('token')}',

              textAlign: TextAlign.justify,
              style: primaryTextStyle.copyWith(
                  fontSize: 12.sp, fontWeight: regular),
            ),
          ],
        ),
      );
    }

    Widget btnlogin(
      double containerh,
      double margintop,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin: EdgeInsets.fromLTRB(
              defaultMargin, margintop, defaultMargin, defaultMargin),
          child: RaisedButton(
            color: primaryColor,
            elevation: 0,
            onPressed: () {
              // Navigator.pushNamed(context, '/daftar');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DaftarMagang(
                          idPerusahaan: widget.posisi.perusahaan!.id.toString(),
                          posisiMagangId: widget.posisi.id.toString())));
              // print(widget.posisi.deskripsi_posisi);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Daftar',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    return Scaffold(
      // backgroundColor: primaryColor,
      body: ColorfulSafeArea(
          color: primaryColor,
          child: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? ListView(
                  children: [
                    banner(),
                    photo(),
                    deskripsi(),
                    persyaratan(),
                    fasilitas(),
                    keterangan(),
                    btnlogin(38.h, 21.h, 18.sp),
                  ],
                )
              : ListView(
                  children: [banner()],
                )),
    );
  }
}

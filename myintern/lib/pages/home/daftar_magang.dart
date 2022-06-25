import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:myintern/models/posisi_model.dart';
import 'package:myintern/pages/widget/loading_button.dart';
import 'package:myintern/pages/widget/loading_button_landscape.dart';
import 'package:myintern/providers/pendaftaran_provider.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class DaftarMagang extends StatefulWidget {
  final String idPerusahaan;

  final String posisiMagangId;

  DaftarMagang(
      {Key? key, required this.idPerusahaan, required this.posisiMagangId})
      : super(key: key);
  // final PosisiModel posisi;
  // const DaftarMagang({
  //   Key? key,
  //   required this.posisi,
  // }) : super(key: key);

  @override
  _DaftarMagangState createState() =>
      _DaftarMagangState(idPerusahaan, posisiMagangId);
}

class _DaftarMagangState extends State<DaftarMagang> {
  void initState() {
    getSession();
    super.initState();
  }

  String idPerusahaan;
  String posisiMagangId;
  _DaftarMagangState(this.idPerusahaan, this.posisiMagangId);
  late int id;

  late String token;
  late String finalDate;

  bool isLoading = false;
  bool initLoad = true;
  DateTime now = new DateTime.now();
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

// DateTime date = new DateTime(now.year, now.month, now.day);
  Future<int> getSession() async {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";

    setState(() {
      finalDate = formattedDate.toString();
    });
    final sp = await SharedPreferences.getInstance();
    setState(() {
      id = sp.getInt('id')!.toInt();
      token = sp.getString('token').toString();

      // print(name);
    });
    print(id);
    print(idPerusahaan);
    print(posisiMagangId);
    print(finalDate);
    return id;
  }

  TextEditingController keteranganCOntroller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    PendaftaranProvider pp = Provider.of(context);
    handleDaftar() async {
      if (keteranganCOntroller.text == '') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Keterangan tidak boleh kosong",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      } else {
        setState(() {
          isLoading = true;
        });
        var data = await pp.daftar(
            userId: id.toString(),
            tglDaftar: finalDate,
            posisiMagangId: posisiMagangId,
            perusahaanId: idPerusahaan,
            keteranganDaftar: keteranganCOntroller.text,
            token: token);
        if (data == 200) {
          print('kondisi berhasil');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: bgGreen,
              content: Text(
                "Pendaftaran Berhasil",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
          // Navigator.popAndPushNamed(context, '/home');
          Navigator.pop(context);
        } else if (data == 400) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: processColor,
              content: Text(
                "Sudah terdaftar",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: alertColor,
              content: Text(
                "Pendaftaran  Gagal",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
        }
        setState(() {
          isLoading = false;
        });
      }
    }

    Widget banner(double fs) {
      return Container(
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
              Center(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Pendaftaran',
                  style:
                      primaryTextStyle.copyWith(fontWeight: bold, fontSize: fs),
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

    Widget nameInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keterangan',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              child: Center(
                child: TextFormField(
                  controller: keteranganCOntroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tidak boleh kosong";
                    }
                  },
                  enableSuggestions: false,
                  autocorrect: false,
                  minLines: 6,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Keterangan singkat pengantar pendaftaran magang',
                    hintMaxLines: null,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2)),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: contentpadw, vertical: contentpadh),
                  ),
                  style: primaryTextStyle.copyWith(fontSize: input),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget btndaftar(
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
              // Navigator.pushNamed(context, '/home');
              handleDaftar();
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
      body: ColorfulSafeArea(
          color: primaryColor,
          child: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? ListView(
                  children: [
                    banner(18.sp),
                    nameInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                    isLoading ? LoadingButton() : btndaftar(38, 21, 18),
                  ],
                )
              : ListView(
                  children: [
                    banner(18),
                    nameInput(18, 14, 38, 15, 10),
                    isLoading
                        ? LoadingButtonLandscape()
                        : btndaftar(38, 21, 18),
                  ],
                )),
    );
  }
}

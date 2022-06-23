import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:myintern/models/posisi_model.dart';
import 'package:myintern/pages/widget/loading_button.dart';
import 'package:myintern/pages/widget/loading_button_landscape.dart';
import 'package:myintern/providers/profile_provider.dart';
import 'package:myintern/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditFotoPage extends StatefulWidget {
  @override
  _EditFotoPageState createState() => _EditFotoPageState();
}

class _EditFotoPageState extends State<EditFotoPage> {
  void initState() {
    getSession();
    super.initState();
  }

  bool isLoading = false;
  bool initLoad = true;
  dynamic _filecv;
  late int id;
  late String token;
  late String fotoCheck;
  late String foto;
  String path = '';
  String fn = '';
  late int size;
  void _pickFileCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      PlatformFile file = result.files.single;
      setState(() {
        _filecv = file.name;
        path = file.path!;
        fn = file.name;
        size = file.size;
        print(size);
      });
    }
  }

  Future<bool> getSession() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      fotoCheck = sp.getString('foto').toString();
      foto =
          'http://portofoliome.my.id/storage/${sp.getString('foto').toString()}';
      token = sp.getString('token').toString();
      id = sp.getInt('id')!.toInt();
      initLoad = false;

      // print(fotoCheck);
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider pp = Provider.of(context);
    handleUpdate() async {
      if (fn == '') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Pilih file terlebih dahulu",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      } else if (size > 1500000) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Ukuran file tidak boleh lebih dari 1,5 MB",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      } else {
        setState(() {
          isLoading = true;
        });
        if (await pp.updateFoto(path: path, token: token)) {
          print('kondisi berhasil');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: bgGreen,
              content: Text(
                "Update Foto Berhasil",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
          Navigator.popAndPushNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: alertColor,
              content: Text(
                "Update Foto Gagal",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
        }
        setState(() {
          isLoading = false;
        });
      }
    }

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
              Container(
                // margin: EdgeInsets.only(bottom: 10.h),
                child: Text(
                  'Update Foto',
                  style: primaryTextStyle.copyWith(
                      color: Colors.black, fontSize: 20.sp, fontWeight: bold),
                ),
              ),
              Expanded(flex: 2, child: Container())
            ],
          ));
    }

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
              child: fotoCheck == ''
                  ? Image.asset(
                      'assets/userf.png',
                      fit: BoxFit.contain,
                    )
                  : Image.network(foto),
            ),
          ],
        ),
      );
    }

    Widget upFoto(
      double containerh,
      double margintop,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, margintop, defaultMargin, 0),
          child: RaisedButton(
            color: Colors.white,
            elevation: 0,
            onPressed: () {
              _pickFileCV();
            },
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.black,
            child: Text(
              _filecv == null ? 'Pilih Foto' : _filecv,
              style: primaryTextStyle.copyWith(
                  color: Colors.black54, fontSize: txt),
            ),
          ));
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
              handleUpdate();
              // Navigator.pushNamed(context, '/home');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Update Foto',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    return Scaffold(
      // backgroundColor: primaryColor,
      body: ColorfulSafeArea(
          color: primaryColor,
          child: (initLoad == true)
              ? Container(
                  child: SpinKitRing(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                )
              : (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? ListView(
                      children: [
                        banner(),
                        // photo(),
                        upFoto(38.h, 0, 14.sp),
                        isLoading
                            ? LoadingButton()
                            : btnlogin(38.h, 21.h, 18.sp),
                      ],
                    )
                  : ListView(
                      children: [
                        banner(),
                        // photo(),
                        upFoto(38, 0, 14),
                        isLoading
                            ? LoadingButtonLandscape()
                            : btnlogin(38, 21, 18),
                      ],
                    )),
    );
  }
}

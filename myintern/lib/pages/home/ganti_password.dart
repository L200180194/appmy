import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:myintern/models/posisi_model.dart';
import 'package:myintern/pages/widget/loading_button.dart';
import 'package:myintern/providers/profile_provider.dart';
import 'package:myintern/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GantiPassword extends StatefulWidget {
  @override
  _GantiPasswordState createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  void initState() {
    getSession();
    super.initState();
  }

  bool _isObscureOld = true;
  bool _isObscureNew = true;
  bool _isObscureVerif = true;

  bool isLoading = false;
  bool initLoad = true;
  TextEditingController passwordOldController = TextEditingController(text: '');
  TextEditingController passwordNewController = TextEditingController(text: '');
  TextEditingController passwordVerifController =
      TextEditingController(text: '');
  int lengthpass = 0;
  _onChangedHuruf(String value) {
    setState(() {
      lengthpass = value.length;
    });
  }

  late String token;

  Future<bool> getSession() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      token = sp.getString('token').toString();
      // print(token);
      initLoad = false;

      // print(fotoCheck);
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider pp = Provider.of(context);
    handleGantiPassword() async {
      if (passwordOldController.text == '' ||
          passwordNewController.text == '' ||
          passwordVerifController.text == '') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Tidak Boleh Kosong",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      } else {
        setState(() {
          isLoading = true;
        });
        if (await pp.gantiPassword(
            password: passwordOldController.text,
            passwordNew: passwordNewController.text,
            passwordVerif: passwordVerifController.text,
            token: token)) {
          print('kondisi berhasil');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: bgGreen,
              content: Text(
                "Ganti Password Berhasil",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
          Navigator.popAndPushNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: alertColor,
              content: Text(
                "Ganti Password Gagal, password salah",
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
                  'Ganti Password',
                  style: primaryTextStyle.copyWith(
                      color: Colors.black, fontSize: 20.sp, fontWeight: bold),
                ),
              ),
              Expanded(flex: 2, child: Container())
            ],
          ));
    }

    Widget passInput(double txt, double containerh, double paddingw,
        double paddingh, double iconsize, double hintsize) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: txt),
            ),
            Container(
              // height: containerh,
              child: TextFormField(
                controller: passwordOldController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else if (value.length < 8) {
                    return " Kurang dari 8 karakter ";
                  }
                },
                obscureText: _isObscureOld,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: paddingw, vertical: paddingh),
                  suffixIcon: IconButton(
                      iconSize: iconsize,
                      icon: Icon(_isObscureOld
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: _isObscureOld ? Colors.grey : primaryColor,
                      onPressed: () {
                        setState(() {
                          _isObscureOld = !_isObscureOld;
                        });
                      }),
                  hintText: 'your password',
                ),
                style: primaryTextStyle.copyWith(fontSize: hintsize),
              ),
            )
          ],
        ),
      );
    }

    Widget passInputNew(double txt, double containerh, double paddingw,
        double paddingh, double iconsize, double hintsize) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Baru',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: txt),
            ),
            Container(
              // height: containerh,
              child: TextFormField(
                controller: passwordNewController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else if (value.length < 8) {
                    return " Kurang dari 8 karakter ";
                  }
                },
                obscureText: _isObscureNew,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: paddingw, vertical: paddingh),
                  suffixIcon: IconButton(
                      iconSize: iconsize,
                      icon: Icon(_isObscureNew
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: _isObscureNew ? Colors.grey : primaryColor,
                      onPressed: () {
                        setState(() {
                          _isObscureNew = !_isObscureNew;
                        });
                      }),
                  hintText: 'your new password',
                ),
                style: primaryTextStyle.copyWith(fontSize: hintsize),
              ),
            )
          ],
        ),
      );
    }

    Widget passInputVerif(double txt, double containerh, double paddingw,
        double paddingh, double iconsize, double hintsize) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ulangi Password',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: txt),
            ),
            Container(
              // height: containerh,
              child: TextFormField(
                controller: passwordVerifController,
                obscureText: _isObscureVerif,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else if (value.length < 8) {
                    return " Kurang dari 8 karakter ";
                  } else if (value != passwordNewController.text) {
                    return "Password berbeda";
                  }
                },
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: paddingw, vertical: paddingh),
                  suffixIcon: IconButton(
                      iconSize: iconsize,
                      icon: Icon(_isObscureVerif
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: _isObscureVerif ? Colors.grey : primaryColor,
                      onPressed: () {
                        setState(() {
                          _isObscureVerif = !_isObscureVerif;
                        });
                      }),
                  hintText: 'your password',
                ),
                style: primaryTextStyle.copyWith(fontSize: hintsize),
              ),
            )
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
              handleGantiPassword();
              // Navigator.pushNamed(context, '/home');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Ganti Password',
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
                        passInput(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                        passInputNew(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                        passInputVerif(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                        isLoading
                            ? LoadingButton()
                            : btnlogin(38.h, 21.h, 18.sp),
                      ],
                    )
                  : ListView(
                      children: [banner()],
                    )),
    );
  }
}

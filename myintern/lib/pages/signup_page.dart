import 'package:flutter/material.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  bool _isObscureVerif = true;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    Widget banner() {
      return Container(
          // color: Colors.amber,
          height: 28.h,
          margin: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: Center(
              child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Registrasi',
              style:
                  primaryTextStyle.copyWith(fontWeight: bold, fontSize: 24.sp),
            ),
          )));
    }

    Widget emailInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              height: containerh,
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'example.gmail.com',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
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
              height: containerh,
              child: TextFormField(
                obscureText: _isObscure,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: paddingw, vertical: paddingh),
                  suffixIcon: IconButton(
                      iconSize: iconsize,
                      icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility),
                      color: _isObscure ? Colors.grey : primaryColor,
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
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
              height: containerh,
              child: TextFormField(
                obscureText: _isObscureVerif,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
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
              'Nama',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              height: containerh,
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'MyIntern',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
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

    Widget tlpInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No Tlp',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              height: containerh,
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '1234567890',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
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

    Widget btnlogin(
      double containerh,
      double margintop,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, margintop, defaultMargin, 0),
          child: RaisedButton(
            color: primaryColor,
            elevation: 0,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Registrasi',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    Widget text(double txt, double btntxt) {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 20),
        child: Row(
          children: [
            Text(
              "Sudah memiliki akun ?",
              style:
                  primaryTextStyle.copyWith(fontSize: txt, fontWeight: regular),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Text(
                ' Masuk',
                style: primaryTextStyle.copyWith(
                    color: Colors.grey, fontSize: btntxt),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
            child: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? ListView(
                    children: [
                      banner(),
                      emailInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      passInput(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                      passInputVerif(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                      nameInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      tlpInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      btnlogin(38.h, 21.h, 18.sp),
                      text(12.sp, 12.sp),
                    ],
                  )
                : ListView(
                    children: [
                      banner(),
                      emailInput(18, 14, 38, 15, 10),
                      passInput(18, 38, 10, 15, 20, 14),
                      passInputVerif(18, 38, 10, 15, 20, 14),
                      nameInput(18, 14, 38, 15, 10),
                      tlpInput(18, 14, 38, 15, 10),
                      btnlogin(38, 21, 18),
                      text(12, 12),
                    ],
                  )));
  }
}

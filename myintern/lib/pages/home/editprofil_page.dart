import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myintern/theme.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({Key? key}) : super(key: key);

  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  bool _isObscure = true;
  bool _isObscureVerif = true;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        height: 220.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(3.0, 3.0), //(x,y)
                blurRadius: 7.0,
              ),
            ],
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            )))),
                Center(
                    child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '  ',
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 18.sp),
                  ),
                )),
                Expanded(flex: 2, child: Container())
              ],
            ),
            Container(
              height: 100.h,
              width: 100.h,
              margin: EdgeInsets.fromLTRB(9, 9, 15, 16),
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
              child: Image.asset('assets/tokopedia.png'),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: Text(
                'Alfianto Andy P',
                style: primaryTextStyle.copyWith(
                    color: Colors.white, fontSize: 18.sp, fontWeight: bold),
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
            top: 1.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
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

    Widget alamatInput(double email, double input, double containerh,
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

    Widget skillInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skill',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              height: containerh,
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Web Programming',
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

    Widget pendidikanInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pendidikan',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              height: containerh,
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Universitas MyIntern',
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

    Widget prodiInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prodi',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              height: containerh,
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Informatika',
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

    Widget emailInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
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

    Widget btnUpdate(
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
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Update',
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
                      header(),
                      nameInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      alamatInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      tlpInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      skillInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      pendidikanInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      prodiInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      emailInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      passInput(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                      passInputVerif(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                      btnUpdate(38.h, 21.h, 18.sp),
                    ],
                  )
                : Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text('AAAAAAAAAAAAAAAAA'),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [],
                          ),
                        )
                      ],
                    ),
                  )));
  }
}

import 'package:flutter/material.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';

class DetailInformasiPage extends StatelessWidget {
  const DetailInformasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget banner() {
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
                  '  ',
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

    Widget foto() {
      return Container(
        // color: Colors.red,
        margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100.h,
              width: 100.h,
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
              child: Image.asset('assets/tokopedia.png'),
            ),
            Center(
              child: Text(
                'BACKEND PROGRAMMER ',
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
                'Jakarta Pusat',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 12.sp, fontWeight: regular),
              ),
            ),
          ],
        ),
      );
    }

    Widget box() {
      return Container(
        padding: EdgeInsets.all(14.sp),
        height: 340.sp,
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
        margin: EdgeInsets.fromLTRB(defaultMargin, 15, defaultMargin, 0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 7.sp),
              child: Text(
                'Keterangan',
                style: primaryTextStyle.copyWith(fontWeight: semibold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum id numquam aspernatur, ullam corporis minus autem eum et facere accusamus nam magnam delectus asperiores eligendi eius nulla aut? Atque, ducimus! Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum id numquam aspernatur, ullam corporis minus autem eum et facere accusamus nam magnam delectus asperiores eligendi eius nulla aut? Atque, ducimus! Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum id numquam aspernatur, ullam corporis minus autem eum et facer ;lasdj;flsjpgjdsopfjvopjfvoisvoinsfvoihfsoivnhsdoihvoidsvoidshvoidsvohdsoivhfoidhfoidhiofdhoifhodhfiodhfoidhoifdhoifndkl',
                  style: primaryTextStyle,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                  color: alertColor,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0.0, 0.0), //(x,y)
                        blurRadius: 7.0,
                        spreadRadius: 3),
                  ]),
              child: Text(
                'Ditolak',
                style: primaryTextStyle.copyWith(
                    color: Colors.white, fontSize: 18.sp),
              ),
            )
          ],
        ),
      );
    }

    Widget btnKeluar(
      double containerh,
      double margintop,
      double marginbtm,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin: EdgeInsets.fromLTRB(
              defaultMargin, margintop, defaultMargin, marginbtm),
          child: RaisedButton(
            color: alertColor,
            elevation: 0,
            onPressed: () {
              // Navigator.pushNamed(context, '/detailinformasi');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            textColor: Colors.white,
            child: Text(
              'Ditolak',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    return Scaffold(
      body: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? ListView(
              children: [
                // Text('Home Page'),
                // Image.asset('assets/tokopedia.png'),
                banner(),
                foto(),
                box(),
                // btnKeluar(38.h, 15.h, 16.sp, 18.sp),
              ],
            )
          : ListView(
              children: [
                // Text('Home Page'),
                // Image.asset('assets/tokopedia.png'),
                banner()
              ],
            ),
    );
  }
}

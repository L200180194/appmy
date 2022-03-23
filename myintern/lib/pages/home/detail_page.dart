import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

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
            Text(
              'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum id numquam aspernatur, ullam corporis minus autem eum et facere accusamus nam magnam delectus asperiores eligendi eius nulla aut? Atque, ducimus! ',
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
            Text(
              'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum id numquam aspernatur, ullam corporis minus autem eum et facere accusamus nam magnam delectus asperiores eligendi eius nulla aut? Atque, ducimus! ',
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
            Text(
              'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorum id numquam aspernatur, ullam corporis minus autem eum et facere accusamus nam magnam delectus asperiores eligendi eius nulla aut? Atque, ducimus! ',
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
            Text(
              'Lorem,aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ipsum dolor sit amet consectetur adipisicing elit. Dolorum id numquam aspernatur, ullam corporis minus autem eum et facere accusamus nam magnam delectus asperiores eligendi eius nulla aut? Atque, ducimus! ',
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
              Navigator.pushNamed(context, '/home');
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

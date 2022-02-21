import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myintern/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        height: 200.h,
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
            Text(
              'Alfianto Andy P',
              style: primaryTextStyle.copyWith(
                  color: Colors.white, fontSize: 18.sp, fontWeight: bold),
            )
          ],
        ),
      );
    }

    Widget abtme() {
      return Container(
        // height: 105.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(3.0, 3.0), //(x,y)
                blurRadius: 7.0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style:
                  primaryTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Nama',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Alfianto Andy P',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Alamat',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Gajahwongan 03/05, Canden, Sambi, Boyolali',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'No Tlp',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      '1234567890',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Skill',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Web Programming',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget PendTer() {
      return Container(
        // height: 105.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.fromLTRB(defaultMargin, 16.h, defaultMargin, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(3.0, 3.0), //(x,y)
                blurRadius: 7.0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pendidikan Terakhir',
              style:
                  primaryTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'universitas',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Universitas Muhammadiyah Surakarta',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Prodi',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'S1 - Informatika',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget Akun() {
      return Container(
        // height: 105.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.fromLTRB(defaultMargin, 16.h, defaultMargin, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(3.0, 3.0), //(x,y)
                blurRadius: 7.0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Akun',
              style:
                  primaryTextStyle.copyWith(fontSize: 14.sp, fontWeight: bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Email',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'alfiantoandy@gmail.com',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Password',
                      style: primaryTextStyle.copyWith(
                          fontSize: 12.sp, fontWeight: bold),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      '**************',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget btnEdit(
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
            color: primaryColor,
            elevation: 0,
            onPressed: () {
              Navigator.pushNamed(context, '/daftar');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Edit',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
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
              // Navigator.pushNamed(context, '/home');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'keluar',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? ListView(
            children: [
              header(),
              abtme(),
              PendTer(),
              Akun(),
              btnEdit(38.h, 21.h, 16.sp, 18.sp),
              btnKeluar(38.h, 0, 16.sp, 18.sp),
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
                    children: [
                      abtme(),
                      PendTer(),
                      Akun(),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

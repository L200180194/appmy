import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myintern/services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  String name = '';
  int id = 0;
  String alamat = '';
  String foto = '';
  String cv = '';
  String notlp = '';
  String email = '';
  String token = '';
  String skill = '';
  String prodi = '';
  String kota = '';
  String fotoCheck = '';
  String pendidikan = '';
  void initState() {
    getSession();
    getInit();
    super.initState();
  }

  logout() async {
    final sp = await SharedPreferences.getInstance();
    sp.remove('name');
    sp.remove('alamat');
    sp.remove('foto');
    sp.remove('cv');
    sp.remove('notlp');
    sp.remove('email');
    sp.remove('token');
    sp.remove('skill');
    sp.remove('prodi');
    sp.remove('kota');
    sp.remove('pendidikan');
    sp.remove('id');
  }

  Future<String> getSession() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      name = sp.getString('name').toString();
      alamat = sp.getString('alamat').toString();
      fotoCheck = sp.getString('foto').toString();
      foto =
          'http://portofoliome.my.id/storage/${sp.getString('foto').toString()}';
      cv = sp.getString('cv').toString();
      notlp = sp.getString('notlp').toString();
      email = sp.getString('email').toString();
      token = sp.getString('token').toString();
      skill = sp.getString('skill').toString();
      prodi = sp.getString('prodi').toString();
      kota = sp.getString('kota').toString();
      pendidikan = sp.getString('pendidikan').toString();
      id = sp.getInt('id')!.toInt();
    });
    // print(foto);
    return name;
  }

  getInit() async {
    Timer(
        Duration(milliseconds: 400),
        () => setState(() {
              isLoading = false;
            }));
  }

  // String fotoUrl = 'http://portofoliome.my.id/storage/${foto}';

  @override
  Widget build(BuildContext context) {
    // AuthProvider ap = Provider.of<AuthProvider>(context);
    // UserModel usr = ap.user;

    AuthProvider ap = Provider.of<AuthProvider>(context);
    // ignore: unused_element
    handleLogout() async {
      if (await ap.logout(token: token)) {
        print('berhasil Logout');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: bgGreen,
            content: Text(
              "Berhasil Keluar",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
        Navigator.popAndPushNamed(context, '/signin');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Gagal logout",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      }
    }

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
                  // image: DecorationImage(image: NetworkImage(user.foto_user)),
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
                  : Image.network(
                      foto,
                      loadingBuilder: (context, child, progress) =>
                          progress == null
                              ? child
                              : Container(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                    ),
            ),
            Text(
              name,
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
                      name,
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
                      alamat,
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
                      notlp,
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
                      skill,
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
                      pendidikan,
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
                      prodi,
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
                      email,
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
              // Navigator.pushNamed(context, '/daftar');
              Navigator.pushNamed(context, '/editprofil');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Edit Profile',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    Widget btnEditpass(
      double containerh,
      double margintop,
      double marginbtm,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, marginbtm),
          child: RaisedButton(
            color: primaryColor,
            elevation: 0,
            onPressed: () {
              // Navigator.pushNamed(context, '/daftar');
              Navigator.pushNamed(context, '/gantipassword');
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
              handleLogout();
              logout();
              // Navigator.pushNamed(context, '/detailinformasi');
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

    return (isLoading == true)
        ? Container(
            child: SpinKitRing(
              color: Colors.blue,
              size: 50.0,
            ),
          )
        : (MediaQuery.of(context).orientation == Orientation.portrait)
            ? ListView(
                children: [
                  header(),
                  abtme(),
                  PendTer(),
                  Akun(),
                  btnEdit(38.h, 21.h, 16.sp, 18.sp),
                  btnEditpass(38.h, 21.h, 16.sp, 18.sp),
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

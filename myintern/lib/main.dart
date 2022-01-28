import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myintern/pages/home/daftar_magang.dart';
import 'package:myintern/pages/home/detail_page.dart';
import 'package:myintern/pages/home/main_page.dart';
import 'package:myintern/pages/signin_page.dart';
import 'package:myintern/pages/signup_page.dart';
import 'package:myintern/pages/splash.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // home: SignInPage(),
        routes: {
          '/': (context) => SplashPage(),
          '/signin': (context) => SignInPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/daftar': (context) => DaftarMagang(),
          '/detail': (context) => DetailPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Halo Semuanya',
          style: secondaryTextStyle,
        ),
      ),
    );
  }
}

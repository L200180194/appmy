import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myintern/pages/home/daftar_magang.dart';
import 'package:myintern/pages/home/editfoto_page.dart';
import 'package:myintern/pages/home/editprofil_page.dart';
import 'package:myintern/pages/home/detail_page.dart';
import 'package:myintern/pages/home/detail_informasi_page.dart';
import 'package:myintern/pages/home/ganti_password.dart';
import 'package:myintern/pages/home/main_page.dart';
import 'package:myintern/pages/home/profile_page.dart';
import 'package:myintern/pages/signin_page.dart';
import 'package:myintern/pages/signup_page.dart';
import 'package:myintern/pages/splash.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/providers/informasi_providers.dart';
import 'package:myintern/providers/pendaftaran_provider.dart';
import 'package:myintern/providers/posisi_provider.dart';
import 'package:myintern/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PosisiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InformasiProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PendaftaranProvider(),
        ),
      ],
      child: ScreenUtilInit(
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
            // '/daftar': (context) => DaftarMagang(),
            // '/detail': (context) => DetailPage(),
            // '/detailinformasi': (context) => DetailInformasiPage(),
            '/editprofil': (context) => EditProfilPage(),
            '/profile': (context) => ProfilePage(),
            '/editfoto': (context) => EditFotoPage(),
            '/gantipassword': (context) => GantiPassword(),
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
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

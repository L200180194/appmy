import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myintern/models/user_model.dart';
import 'package:myintern/pages/widget/loading_button.dart';
import 'package:myintern/pages/widget/loading_button_landscape.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/providers/posisi_provider.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int lengthpass = 0;
  _onChangedHuruf(String value) {
    setState(() {
      lengthpass = value.length;
    });
  }

  bool isLoading = false;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    AuthProvider ap = Provider.of<AuthProvider>(context);
    // ignore: unused_element
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });
      if (await ap.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.popAndPushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Gagal Login",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget banner() {
      return Container(
        // color: Colors.amber,
        height: screenHeight / 5,
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin),
        child: Center(
            child: Column(
          children: [
            Container(
              height: screenHeight / 7,
              width: screenHeight / 7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/myintern.png'))),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Selamat Datang',
                style: primaryTextStyle.copyWith(
                    fontWeight: bold, fontSize: 24.sp),
              ),
            )
          ],
        )),
      );
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
              constraints: BoxConstraints(minHeight: containerh),
              // height: containerh,
              child: Center(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: "Tidak Boleh Kosong "),
                      EmailValidator(errorText: "Bukan Merupakan Email")
                    ],
                  ),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'example.gmail.com',
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
              // height: containerh,
              child: TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else if (value.length < 8) {
                    return " Kurang dari 8 karakter ";
                  }
                },
                obscureText: _isObscure,
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
            onPressed: () {
              // Navigator.pushNamed(context, '/home');
              handleSignIn();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Masuk',
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
              "Belum memiliki akun ?",
              style:
                  primaryTextStyle.copyWith(fontSize: txt, fontWeight: regular),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                ' Registrasi',
                style: primaryTextStyle.copyWith(
                    color: Colors.grey, fontSize: btntxt),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ColorfulSafeArea(
            color: primaryColor,
            child: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? ListView(
                    children: [
                      // Text('Potrait')
                      banner(),
                      emailInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      passInput(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                      isLoading ? LoadingButton() : btnlogin(38.h, 21.h, 18.sp),
                      text(12.sp, 12.sp),
                    ],
                  )
                : ListView(
                    children: [
                      // banner(),
                      // emailInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                      // passInput(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                      // btnlogin(38.h, 21.h, 18.sp),
                      // text(12.sp, 12.sp),
                      banner(),
                      emailInput(25.sp, 20.sp, 38.h, 15.h, 10.w),
                      passInput(25.sp, 38.h, 10.w, 15.h, 20.sp, 20.sp),
                      isLoading
                          ? LoadingButtonLandscape()
                          : btnlogin(70.h, 21.h, 30.sp),
                      text(20.sp, 20.sp),
                    ],
                  )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myintern/pages/widget/loading_button.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/services/auth_service.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  bool _isObscureVerif = true;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController alamatController = TextEditingController(text: '');
  TextEditingController passwordVerifController =
      TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController tlpController = TextEditingController(text: '');
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int lengthpass = 0;
  _onChangedHuruf(String value) {
    setState(() {
      lengthpass = value.length;
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    AuthProvider ap = Provider.of<AuthProvider>(context);
    // ignore: unused_element
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await ap.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          notlp_user: tlpController.text,
          alamat_user: alamatController.text)) {
        Navigator.popAndPushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Registrasi Gagal",
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
                  } else if (value != passwordController.text) {
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
              // height: containerh,
              child: Center(
                child: TextFormField(
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      RequiredValidator(errorText: "Tidak Boleh Kosong "),
                  decoration: InputDecoration(
                    hintText: 'MyIntern',
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
              // height: containerh,
              child: Center(
                child: TextFormField(
                  controller: tlpController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      RequiredValidator(errorText: "Tidak Boleh Kosong "),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: '1234567890',
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
              'Alamat',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              // height: containerh,
              child: Center(
                child: TextFormField(
                  controller: alamatController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      RequiredValidator(errorText: "Tidak Boleh Kosong "),
                  decoration: InputDecoration(
                    hintText: ' Jl. MyIntern',
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

    Widget btnlogin(
      double containerh,
      double margintop,
      double txt,
    ) {
      // return LoadingButton();
      return Container(
          height: containerh,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, margintop, defaultMargin, 0),
          child: RaisedButton(
            color: primaryColor,
            elevation: 0,
            onPressed: () {
              handleSignUp();
              // Navigator.pushNamed(context, '/home');
            },
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
        body: ColorfulSafeArea(
            color: primaryColor,
            child: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? Form(
                    key: formkey,
                    child: ListView(
                      children: [
                        banner(),
                        emailInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                        passInput(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                        passInputVerif(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                        nameInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                        tlpInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                        alamatInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                        isLoading
                            ? LoadingButton()
                            : btnlogin(38.h, 21.h, 18.sp),
                        text(12.sp, 12.sp),
                      ],
                    ),
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

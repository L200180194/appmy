import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:myintern/pages/home/search_result.dart';
import 'package:myintern/pages/widget/posisi_card.dart';
import 'package:myintern/pages/widget/posisi_cardlandscape.dart';
import 'package:myintern/providers/posisi_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isLoading = true;
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<PosisiProvider>(context, listen: false).getPosisi();
    setState(() {
      isLoading = false;
    });
  }

  @override
  TextEditingController SearchCntroller = TextEditingController(text: '');

  Widget build(BuildContext context) {
    PosisiProvider pp = Provider.of<PosisiProvider>(context);
    Widget banner() {
      var sp;
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
                  'Cari',
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

    Widget emailInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: containerh),
              // height: containerh,
              child: Center(
                child: TextFormField(
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: "Tidak Boleh Kosong "),
                    ],
                  ),
                  controller: SearchCntroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Developer',
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

    Widget butonCari(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchResultPage(src: SearchCntroller.text)));
              // Navigator.pushNamed(context, '/searchresult');
              // handleDaftar();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Cari',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    // Widget nameInput(double email, double input, double containerh,
    //     double contentpadh, double contentpadw) {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: 11.h, left: defaultMargin, right: defaultMargin),
    //     // color: primaryColor,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           child: Center(
    //             child: TextFormField(
    //               controller: SearchCntroller,
    //               autovalidateMode: AutovalidateMode.onUserInteraction,
    //               validator: (value) {
    //                 if (value!.isEmpty) {
    //                   return "Tidak boleh kosong";
    //                 }
    //               },
    //               enableSuggestions: false,
    //               autocorrect: false,
    //               keyboardType: TextInputType.multiline,
    //               decoration: InputDecoration(
    //                 hintText: 'Developer',
    //                 hintMaxLines: null,
    //                 enabledBorder: OutlineInputBorder(
    //                     borderSide: BorderSide(
    //                   color: Colors.black,
    //                 )),
    //                 focusedBorder: OutlineInputBorder(
    //                     borderSide: BorderSide(color: primaryColor, width: 2)),
    //                 errorBorder: OutlineInputBorder(
    //                     borderSide: BorderSide(color: primaryColor, width: 2)),
    //                 contentPadding: EdgeInsets.symmetric(
    //                     horizontal: contentpadw, vertical: contentpadh),
    //               ),
    //               style: primaryTextStyle.copyWith(fontSize: input),
    //             ),
    //           ),
    //         ),
    //         // btnCari(38, 21, 18),
    //       ],
    //     ),
    //   );
    // }

    Widget btnCari(
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
              // handleDaftar();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Cari',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    Widget informasi() {
      return Container(
          margin: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/search.png',
                // width: 250.w,
                // height: 250.h,
              ),
              Text(
                'Cari posisi magang.',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(fontSize: 20.sp),
              ),
            ],
          ));
    }

    return Scaffold(
      body: ColorfulSafeArea(
          color: primaryColor,
          child: (isLoading == true)
              ? Container(
                  child: SpinKitRing(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                )
              : (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? ListView(
                      children: [
                        banner(),
                        emailInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                        butonCari(38, 21, 18),
                        informasi()
                      ],
                    )
                  : ListView(
                      children: [
                        banner(),
                        emailInput(18, 14, 38.h, 15.h, 10.w),
                        butonCari(38, 21, 18),
                        informasi()
                      ],
                    )),
    );
  }
}

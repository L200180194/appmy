import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myintern/theme.dart';

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({Key? key}) : super(key: key);

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

    return Scaffold(
        body: ColorfulSafeArea(
            color: primaryColor,
            child: (MediaQuery.of(context).orientation == Orientation.portrait)
                ? ListView(
                    children: [header()],
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

import 'package:flutter/material.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PosisiCard extends StatelessWidget {
  const PosisiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 17.h,
        ),
        Container(
          height: 105.h,
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
            children: [
              Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.h,
                    margin: EdgeInsets.fromLTRB(9, 9, 15, 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                  Container(
                    height: 50.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 210.w,
                          child: Text(
                            "BACKEND PROGRAMMER",
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: primaryTextStyle.copyWith(
                                fontSize: 14.sp, fontWeight: bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12.h),
                          child: SizedBox(
                            width: 210.w,
                            child: Text(
                              "TOKOPEDIA",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 12.sp, fontWeight: regular),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

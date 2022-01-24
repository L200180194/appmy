import 'package:flutter/material.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PosisiCardLandscape extends StatelessWidget {
  const PosisiCardLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 17,
        ),
        Container(
          height: 105,
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
                    height: 50,
                    width: 50,
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
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 270.w,
                          child: Text(
                            "BACKEND PROGRAMMER aaaaaaaaa aaaaaaaaa aaaa aaaaaaaaa aaaaaaaa aaaaaaaaaaaaaa aaaaaaaaaaaaaaa",
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: primaryTextStyle.copyWith(
                                fontSize: 14, fontWeight: bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: SizedBox(
                            width: 210,
                            child: Text(
                              "TOKOPEDIA",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 12, fontWeight: regular),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      margin: EdgeInsets.only(left: 9),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: blueclipColor),
                      child: Text(
                        'Kalimantan Barat',
                        style: primaryTextStyle.copyWith(fontSize: 12),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      margin: EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: blueclipColor),
                      child: Text(
                        'Paid',
                        style: primaryTextStyle.copyWith(fontSize: 12),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                          margin: EdgeInsets.only(right: 20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            '30/01/2022',
                            style: primaryTextStyle.copyWith(fontSize: 12),
                          )))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

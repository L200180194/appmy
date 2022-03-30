import 'package:flutter/material.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: containerh,
        margin: EdgeInsets.fromLTRB(defaultMargin, 21.h, defaultMargin, 0),
        child: RaisedButton(
          color: primaryColor,
          elevation: 0,
          onPressed: () {
            () {};
            // Navigator.pushNamed(context, '/home');
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 11.w),
                  width: 16.w,
                  height: 16.h,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
              Text(
                'Loading',
                style: primaryTextStyle.copyWith(
                    color: Colors.white, fontSize: 18.sp),
              ),
            ],
          ),
        ));
  }
}

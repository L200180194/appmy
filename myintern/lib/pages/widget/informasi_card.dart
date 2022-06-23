import 'package:flutter/material.dart';
import 'package:myintern/models/pendaftaran_model.dart';
import 'package:myintern/models/posisi_model.dart';
import 'package:myintern/pages/home/detail_informasi_page.dart';
import 'package:myintern/pages/home/detail_page.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformasiCard extends StatelessWidget {
  // const InformasiCard({Key? key}) : super(key: key);
  final PendaftaranModel informasi;
  InformasiCard(this.informasi);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 17.h,
        ),
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, '/detail');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailInformasiPage(
                          daftar: informasi,
                        )));
          },
          child: Container(
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
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0.0, 0.0), //(x,y)
                                blurRadius: 7.0,
                                spreadRadius: 3),
                          ]),
                      child: Image.network(
                          'http://portofoliome.my.id/storage/${informasi.fotoPosisi}'),
                    ),
                    Container(
                      height: 50.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 220.w,
                            child: Text(
                              '${informasi.namaPosisi}',
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
                                "${informasi.namaPerusahaan}",
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
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 2.h),
                          margin: EdgeInsets.only(left: 9.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: blueclipColor),
                          child: Text(
                            '${informasi.alamatPerusahaan}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: primaryTextStyle.copyWith(fontSize: 10.sp),
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 2.h),
                          margin: EdgeInsets.only(left: 4.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: blueclipColor),
                          child: Text(
                            '${informasi.keteranganPosisi}',
                            overflow: TextOverflow.ellipsis,
                            style: primaryTextStyle.copyWith(fontSize: 10.sp),
                          )),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.only(right: 20.w),
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${informasi.deadlinePosisi}',
                              style: primaryTextStyle.copyWith(fontSize: 12.sp),
                            )))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

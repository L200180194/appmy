import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';

class DaftarMagang extends StatefulWidget {
  const DaftarMagang({Key? key}) : super(key: key);

  @override
  _DaftarMagangState createState() => _DaftarMagangState();
}

class _DaftarMagangState extends State<DaftarMagang> {
  dynamic _filecv;
  dynamic _filesk;
  dynamic _filespl;

  void _pickFileCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx']);
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _filecv = file.name;
      });
    }
  }

  void _pickFilesk() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx']);
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _filesk = file.name;
      });
    }
  }

  void _pickFilespl() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx']);
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _filespl = file.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget banner() {
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
                  'Pendaftaran',
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
              height: containerh,
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'MyIntern',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
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
              height: containerh,
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Jl. MyIntern',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
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
              height: containerh,
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '1234567890',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                    )),
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

    Widget title(double fs, margintop, String text) {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, margintop, defaultMargin, 0),
        child: Text(
          text,
          style: primaryTextStyle.copyWith(fontWeight: semibold, fontSize: fs),
        ),
      );
    }

    Widget upCv(
      double containerh,
      double margintop,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, margintop, defaultMargin, 0),
          child: RaisedButton(
            color: Colors.white,
            elevation: 0,
            onPressed: () {
              _pickFileCV();
            },
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.black,
            child: Text(
              _filecv == null ? 'Upload CV' : _filecv,
              style: primaryTextStyle.copyWith(
                  color: Colors.black54, fontSize: txt),
            ),
          ));
    }

    Widget upSk(
      double containerh,
      double margintop,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, margintop, defaultMargin, 0),
          child: RaisedButton(
            color: Colors.white,
            elevation: 0,
            onPressed: () {
              _pickFilesk();
            },
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.black,
            child: Text(
              _filesk == null ? 'Upload Surat Keterangan' : _filecv,
              style: primaryTextStyle.copyWith(
                  color: Colors.black54, fontSize: txt),
            ),
          ));
    }

    Widget upspl(
      double containerh,
      double margintop,
      double txt,
    ) {
      return Container(
          height: containerh,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, margintop, defaultMargin, 0),
          child: RaisedButton(
            color: Colors.white,
            elevation: 0,
            onPressed: () {
              _pickFilespl();
            },
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.black,
            child: Text(
              _filespl == null ? 'Upload Surat Persyaratan Lainya' : _filecv,
              style: primaryTextStyle.copyWith(
                  color: Colors.black54, fontSize: txt),
            ),
          ));
    }

    Widget btndaftar(
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
              Navigator.pushNamed(context, '/home');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Daftar',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
    }

    return Scaffold(
      body: ColorfulSafeArea(
          color: primaryColor,
          child: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? ListView(
                  children: [
                    banner(),
                    nameInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                    alamatInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                    tlpInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                    title(18.sp, 15.h, 'Upload CV'),
                    upCv(38.h, 0, 14.sp),
                    title(18.sp, 15.h, 'Upload Surat Keterangan'),
                    upSk(38.h, 0, 14.sp),
                    title(18.sp, 15.h, 'Upload Surat Persyaratan Lainya'),
                    upspl(38.h, 0, 14.sp),
                    btndaftar(38, 21, 18),
                  ],
                )
              : ListView(
                  children: [
                    banner(),
                    nameInput(18, 14, 38, 15, 10),
                    alamatInput(18, 14, 38, 15, 10),
                    tlpInput(18, 14, 38, 15, 10),
                    tlpInput(18, 14, 38, 15, 10),
                    tlpInput(18, 14, 38, 15, 10),
                    tlpInput(18, 14, 38, 15, 10),
                    btndaftar(38, 21, 18),
                  ],
                )),
    );
  }
}
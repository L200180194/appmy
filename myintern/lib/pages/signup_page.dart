import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myintern/models/kota_model.dart';
import 'package:myintern/models/pendidikan_model.dart';
import 'package:myintern/models/prodi_model.dart';
import 'package:myintern/models/skill_model.dart';
import 'package:myintern/pages/widget/loading_button.dart';
import 'package:myintern/pages/widget/loading_button_landscape.dart';
import 'package:myintern/providers/auth_providers.dart';
import 'package:myintern/providers/informasi_providers.dart';
import 'package:myintern/services/auth_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:myintern/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void initState() {
    getInit();
    super.initState();
  }

  bool _isObscure = true;
  bool _isObscureVerif = true;
  String? selected;
  late List<String> arr;
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

  // void initState() {
  //   getInit();
  //   super.initState();
  // }

  // getInit() async {
  //   await Provider.of<PosisiProvider>(context, listen: false).getPosisi();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  getInit() async {
    // arr = await getKota();
    await Provider.of<InformasiProviders>(context, listen: false).getKota();
    await Provider.of<InformasiProviders>(context, listen: false).getProdi();
    await Provider.of<InformasiProviders>(context, listen: false).getSkill();
    await Provider.of<InformasiProviders>(context, listen: false)
        .getPendidikan();
    setState(() {
      initLoad = false;
    });
  }

  Future<List<String>> getKota() async {
    var urlKota = Uri.parse('http://portofoliome.my.id/api/kota/all');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(urlKota, headers: headers);
    // print(response);
    if (response.statusCode == 200) {
      List<String> data = jsonDecode(response.body)['data']['kota'];
      // List<KotaModel> posisi = [];

      // for (var item in data) {
      //   posisi.add(KotaModel.fromJson(item));
      // }
      print(data);
      arr = data;
      return data;
    } else {
      throw Exception('Gagal get Posisi');
    }
  }

  bool isLoading = false;
  bool initLoad = true;
  List<String> data = ["a", "b", "c", "d", "e"];
  dynamic _filecv;
  late String path;
  late String fn;
  late int size;
  late String kota;
  late String pendidikan;
  late String prod;
  late String skill;
  // late Map kota;

  void _pickFileCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx']);
    if (result != null) {
      PlatformFile file = result.files.single;
      setState(() {
        _filecv = file.name;
        path = file.path!;
        fn = file.name;
        size = file.size;
        print(size);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    AuthProvider ap = Provider.of<AuthProvider>(context);
    InformasiProviders ip = Provider.of<InformasiProviders>(context);
    // List<String> arr = ip.kotas.toList();
    // print(ip.kotas.runtimeType);
    List<KotaModel> km =
        List<KotaModel>.from(ip.kotas.map((e) => KotaModel.fromJson(e)));
    List<PendidikanModel> pm = List<PendidikanModel>.from(
        ip.pendidikans.map((e) => PendidikanModel.fromJson(e)));
    List<ProdiModel> prm =
        List<ProdiModel>.from(ip.prodis.map((e) => ProdiModel.fromJson(e)));
    List<SkillModel> sm =
        List<SkillModel>.from(ip.skills.map((e) => SkillModel.fromJson(e)));
    // print(prm);
    // ignore: unused_element

    handleSignUp() async {
      if (nameController.text == '' ||
          emailController.text == '' ||
          passwordController.text == '' ||
          tlpController.text == '' ||
          alamatController.text == '' ||
          fn == '' ||
          kota == '' ||
          pendidikan == '' ||
          path == '' ||
          prod == '' ||
          skill == '') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Tidak boleh Kosong",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      } else if (size > 1500000) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Ukuran file tidak boleh lebih dari 1,5 MB",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      } else {
        setState(() {
          isLoading = true;
        });
        if (await ap.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            notlp_user: tlpController.text,
            alamat_user: alamatController.text,
            fn: fn,
            kota_id: kota,
            path: path,
            pendidikan_id: pendidikan,
            prodi_id: prod,
            skill_id: skill)) {
          print('kondisi berhasil');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: bgGreen,
              content: Text(
                "Registrasi Berhasil",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
          Navigator.popAndPushNamed(context, '/signin');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: alertColor,
              content: Text(
                "Registrasi Gagal, Email sudah terdaftar",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
        }
        setState(() {
          isLoading = false;
        });
      }
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
                  autofocus: false,
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

    Widget kotaInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kota',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: containerh,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: DropdownSearch<KotaModel>(
                  mode: Mode.DIALOG,
                  // showSelectedItems: true,
                  items: km,
                  // onFind: (text) async {
                  //   var urlKota =
                  //       Uri.parse('http://portofoliome.my.id/api/kota/all');
                  //   var headers = {'Content-Type': 'application/json'};
                  //   var response = await http.get(urlKota, headers: headers);
                  //   List data = (jsonDecode(response.body)
                  //       as Map<String, dynamic>)['data']['kota'];
                  //   List<KotaModel> kotaName = [];
                  //   data.forEach((element) {
                  //     kotaName.add(KotaModel(
                  //         id: element['id'], nama_kota: element['nama_kota']));
                  //   });
                  //   return kotaName;
                  // },
                  // items: km,
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text(item.namaKota),
                  ),
                  showSearchBox: true,
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.namaKota ?? 'Pilih Kota'),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih kota",
                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      kota = value!.id.toString();
                    });
                    print(kota);
                  },
                  // selectedItem: "Brazil",
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget PendidikanInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pendidikan',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: containerh,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: DropdownSearch<PendidikanModel>(
                  mode: Mode.DIALOG,
                  // showSelectedItems: true,
                  items: pm,
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text(item.tingkatPendidikan),
                  ),
                  showSearchBox: true,
                  dropdownBuilder: (context, selectedItem) => Text(
                      selectedItem?.tingkatPendidikan ??
                          'Pilih Pendidikan Terakhir'),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih Pendidikan Terakhir",

                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pendidikan = value!.id.toString();
                    });
                    print(pendidikan);
                  },
                  // selectedItem: "Brazil",
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget ProdiInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Program Studi',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: containerh,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: DropdownSearch<ProdiModel>(
                  mode: Mode.DIALOG,
                  // showSelectedItems: true,
                  items: prm,
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text(item.namaProdi),
                  ),
                  showSearchBox: true,
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.namaProdi ?? 'Pilih Program Studi'),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih Program Studi",

                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      prod = value!.id.toString();
                    });
                    print(prod);
                  },
                  // selectedItem: "Brazil",
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget SkillInput(double email, double input, double containerh,
        double contentpadh, double contentpadw) {
      return Container(
        margin: EdgeInsets.only(
            top: 11.h, left: defaultMargin, right: defaultMargin),
        // color: primaryColor,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skill',
              style: primaryTextStyle.copyWith(
                  fontWeight: semibold, fontSize: email),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: containerh,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: DropdownSearch<SkillModel>(
                  mode: Mode.DIALOG,
                  // showSelectedItems: true,
                  items: sm,
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text(item.namaSkill),
                  ),
                  showSearchBox: true,
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.namaSkill ?? 'Pilih Skill'),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih Skill",

                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      skill = value!.id.toString();
                    });
                    print(skill);
                  },
                  // selectedItem: "Brazil",
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
              // Navigator.pushNamed(context, '/daftar');
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
            child: (initLoad == true)
                ? Container(
                    child: SpinKitRing(
                      color: Colors.blue,
                      size: 50.0,
                    ),
                  )
                : (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? Form(
                        key: formkey,
                        child: ListView(
                          children: [
                            banner(),
                            emailInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            passInput(18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                            passInputVerif(
                                18.sp, 38.h, 10.w, 15.h, 20.sp, 14.sp),
                            nameInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            tlpInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            alamatInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            kotaInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            PendidikanInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            ProdiInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            SkillInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                            title(18.sp, 15.h, 'Upload CV'),
                            upCv(38.h, 0, 14.sp),
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
                          alamatInput(18, 14, 38, 15, 10),
                          kotaInput(18, 14, 45, 15, 10),
                          PendidikanInput(18, 14, 45, 15, 10),
                          ProdiInput(18, 14, 45, 15, 10),
                          SkillInput(18, 14, 45, 15, 10),
                          title(18, 15.h, 'Upload CV'),
                          upCv(38, 0, 14),
                          isLoading
                              ? LoadingButtonLandscape()
                              : btnlogin(38, 21, 18),
                          text(12, 12),
                          // text(12, 12),
                        ],
                      )));
  }
}

class Width {}

class Srting {}

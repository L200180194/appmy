import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:myintern/models/kota_model.dart';
import 'package:myintern/models/pendidikan_model.dart';
import 'package:myintern/models/prodi_model.dart';
import 'package:myintern/models/skill_model.dart';
import 'package:myintern/pages/widget/loading_button.dart';
import 'package:myintern/pages/widget/loading_button_landscape.dart';
import 'package:myintern/providers/informasi_providers.dart';
import 'package:myintern/providers/profile_provider.dart';
import 'package:myintern/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({Key? key}) : super(key: key);

  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  void initState() {
    getInit();
    getSession();
    super.initState();
  }

  bool isLoading = false;
  bool initLoad = true;
  dynamic _filecv;
  late String name;
  late int id;
  late String alamat;
  late String foto;
  late String cv;
  late String notlp;
  late String email;
  late String token;
  late String fotoCheck;
  String path = '';
  String fn = '';
  late int size;
  late String kota;
  late String kota_id;
  late String pendidikan;
  late String pendidikan_id;
  late String prod;
  late String prod_id;
  late String skill;
  late String skill_id;
  TextEditingController alamatController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController tlpController = TextEditingController(text: '');
  void _pickFileCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf']);
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

  getInit() async {
    // arr = await getKota();
    await Provider.of<InformasiProviders>(context, listen: false).getKota();
    await Provider.of<InformasiProviders>(context, listen: false).getProdi();
    await Provider.of<InformasiProviders>(context, listen: false).getSkill();
    await Provider.of<InformasiProviders>(context, listen: false)
        .getPendidikan();
    setState(() {
      // initLoad = false;
    });
  }

  Future<String> getSession() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      name = sp.getString('name').toString();
      alamat = sp.getString('alamat').toString();
      cv = sp.getString('cv').toString();
      fotoCheck = sp.getString('foto').toString();
      foto =
          'http://portofoliome.my.id/storage/${sp.getString('foto').toString()}';
      notlp = sp.getString('notlp').toString();
      email = sp.getString('email').toString();
      token = sp.getString('token').toString();
      skill = sp.getString('skill').toString();
      skill_id = sp.getInt('skill_id').toString();
      prod = sp.getString('prodi').toString();
      prod_id = sp.getInt('prodi_id').toString();
      kota = sp.getString('kota').toString();
      kota_id = sp.getInt('kota_id').toString();
      pendidikan = sp.getString('pendidikan').toString();
      pendidikan_id = sp.getInt('pendidikan_id').toString();
      id = sp.getInt('id')!.toInt();
      initLoad = false;
      alamatController.text = alamat;
      nameController.text = name;
      tlpController.text = notlp;
      // print(name);
    });
    print(prod_id);
    return name;
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider pp = Provider.of(context);
    handeleditProfile() async {
      if (nameController.text == '' ||
          tlpController.text == '' ||
          alamatController.text == '' ||
          kota_id == '' ||
          pendidikan_id == '' ||
          prod_id == '' ||
          skill_id == '') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Tidak boleh Kosong",
              style: primaryTextStyle.copyWith(color: Colors.white),
            )));
      } else {
        setState(() {
          isLoading = true;
        });
        if (await pp.updateProfile(
            name: nameController.text,
            notlp_user: tlpController.text,
            alamat_user: alamatController.text,
            fn: fn,
            kota_id: kota_id,
            path: path,
            pendidikan_id: pendidikan_id,
            token: token,
            prodi_id: prod_id,
            skill_id: skill_id)) {
          print('kondisi berhasil');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: bgGreen,
              content: Text(
                "Update Berhasil",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
          Navigator.popAndPushNamed(context, '/home');
        } else if (size > 1500000) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: alertColor,
              content: Text(
                "Ukuran file tidak boleh lebih dari 1,5 MB",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: alertColor,
              content: Text(
                "Update Gagal",
                style: primaryTextStyle.copyWith(color: Colors.white),
              )));
        }
        setState(() {
          isLoading = false;
        });
      }
    }

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
    Widget header() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        height: (MediaQuery.of(context).orientation == Orientation.portrait)
            ? 220.h
            : 250.h,
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
            Row(
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
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            )))),
                Center(
                    child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '  ',
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 18.sp),
                  ),
                )),
                Expanded(flex: 2, child: Container())
              ],
            ),
            Stack(
              alignment: Alignment.bottomRight,
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
                  child: fotoCheck == ''
                      ? Image.asset(
                          'assets/userf.png',
                          fit: BoxFit.contain,
                        )
                      : Image.network(
                          foto,
                          loadingBuilder: (context, child, progress) =>
                              progress == null
                                  ? child
                                  : Container(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                        ),
                ),
                Container(
                  width: 40.h,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/editfoto');
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 20.sp,
                      )),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: Text(
                'Update Profile',
                style: primaryTextStyle.copyWith(
                    color: Colors.white, fontSize: 18.sp, fontWeight: bold),
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
                  // initialValue: 'aaaaa',
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

    Widget skillInput(double email, double input, double containerh,
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
                      Text(selectedItem?.namaSkill ?? skill),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih Skill",

                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      skill_id = value!.id.toString();
                    });
                    print(skill_id);
                  },
                  // selectedItem: "Brazil",
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
                  // selectedItem: ,
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
                      Text(selectedItem?.namaKota ?? kota),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih kota",
                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      kota_id = value!.id.toString();
                    });
                    print(kota_id);
                  },
                  // selectedItem: "Brazil",
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget pendidikanInput(double email, double input, double containerh,
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
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.tingkatPendidikan ?? pendidikan),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih Pendidikan Terakhir",

                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      pendidikan_id = value!.id.toString();
                    });
                    print(pendidikan_id);
                  },
                  // selectedItem: "Brazil",
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget prodiInput(double email, double input, double containerh,
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
                      Text(selectedItem?.namaProdi ?? prod),
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Pilih Program Studi",

                    // border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      prod_id = value!.id.toString();
                    });
                    print(prod_id);
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

    Widget btnUpdate(
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
              handeleditProfile();
              // Navigator.pushNamed(context, '/home');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textColor: Colors.white,
            child: Text(
              'Update',
              style:
                  primaryTextStyle.copyWith(color: Colors.white, fontSize: txt),
            ),
          ));
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
                    ? ListView(
                        children: [
                          header(),
                          nameInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                          alamatInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                          kotaInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                          tlpInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                          skillInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                          pendidikanInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                          prodiInput(18.sp, 14.sp, 38.h, 15.h, 10.w),
                          title(18.sp, 15.h, 'Upload CV'),
                          upCv(38.h, 0, 14.sp),
                          isLoading
                              ? LoadingButton()
                              : btnUpdate(38.h, 21.h, 18.sp),
                        ],
                      )
                    : ListView(
                        children: [
                          header(),
                          nameInput(18, 14, 38, 15, 10),
                          alamatInput(18, 14, 38, 15, 10),
                          kotaInput(18, 14, 45, 15, 10),
                          tlpInput(18, 14, 45, 15, 10),
                          skillInput(18, 14, 45, 15, 10),
                          pendidikanInput(18, 14, 45, 15, 10),
                          prodiInput(18, 14, 45, 15, 10),
                          title(18, 15.h, 'Upload CV'),
                          upCv(38, 0, 14),
                          isLoading
                              ? LoadingButtonLandscape()
                              : btnUpdate(38, 21, 18),
                        ],
                      )));
  }
}

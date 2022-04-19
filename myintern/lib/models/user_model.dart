import 'package:flutter/cupertino.dart';
import 'package:myintern/models/kota_model.dart';
import 'package:myintern/models/pendidikan_model.dart';
import 'package:myintern/models/prodi_model.dart';
import 'package:myintern/models/skill_model.dart';

class UserModel {
  int? id;
  String? name;
  String? alamat_user;
  String? foto_user;
  String? cv_user;
  String? email;
  String? password;
  String? notlp_user;
  KotaModel? kota;
  PendidikanModel? pendidikan;
  ProdiModel? prodi;
  SkillModel? skill;
  String? token;
  UserModel(
      {this.id,
      this.name,
      this.alamat_user,
      this.foto_user,
      this.cv_user,
      this.email,
      this.notlp_user,
      this.kota,
      this.password,
      this.pendidikan,
      this.prodi,
      this.skill,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alamat_user = json['alamat_user'];
    foto_user = json['foto_user'];
    cv_user = json['cv_user'];
    notlp_user = json['notlp_user'];
    email = json['email'];
    password = json['password'];
    kota = KotaModel.fomJson(json['kota']);
    pendidikan = PendidikanModel.fromJson(json['pendidikan']);
    prodi = ProdiModel.fromJson(json['prodi']);
    skill = SkillModel.fromJson(json['skill']);
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alamat_user': alamat_user,
      'foto_user': foto_user,
      'cv_user': cv_user,
      'notlp_user': notlp_user,
      'email': email,
      'password': password,
      'kota': kota!.toJson(),
      'pendidikan': pendidikan!.toJson(),
      'prodi': prodi!.toJson(),
      'skill': skill!.toJson(),
      'token': token,
    };
  }
}

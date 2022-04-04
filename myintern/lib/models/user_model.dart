import 'package:flutter/cupertino.dart';

class UserModel {
  int? id;
  String? name;
  String? alamat_user;
  String? foto_user;
  String? cv_user;
  String? email;
  String? password;
  String? notlp_user;
  int? kota_id;
  int? pendidikan_id;
  int? prodi_id;
  int? skill_id;
  String? token;
  UserModel(
      {this.id,
      this.name,
      this.alamat_user,
      this.foto_user,
      this.cv_user,
      this.email,
      this.notlp_user,
      this.kota_id,
      this.password,
      this.pendidikan_id,
      this.prodi_id,
      this.skill_id,
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
    kota_id = json['kota_id'];
    pendidikan_id = json['pendidikan_id'];
    prodi_id = json['prodi_id'];
    skill_id = json['skill_id'];
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
      'kota_id': kota_id,
      'pendidikan_id': pendidikan_id,
      'prodi_id': prodi_id,
      'skill_id': skill_id,
      'token': token,
    };
  }
}

// To parse this JSON data, do
//
//     final pendaftaranModel = pendaftaranModelFromJson(jsonString);

import 'dart:convert';

PendaftaranModel pendaftaranModelFromJson(String str) =>
    PendaftaranModel.fromJson(json.decode(str));

String pendaftaranModelToJson(PendaftaranModel data) =>
    json.encode(data.toJson());

class PendaftaranModel {
  PendaftaranModel({
    required this.id,
    required this.namaPerusahaan,
    required this.alamatPerusahaan,
    required this.fotoPerusahaan,
    required this.email,
    required this.password,
    required this.statusPerusahaan,
    required this.suratPerusahaan,
    required this.tglStatusperusahaan,
    required this.deskripsiPerusahaan,
    required this.notlpPerusahaan,
    required this.adminId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.alamatUser,
    required this.fotoUser,
    required this.cvUser,
    required this.notlpUser,
    required this.emailVerifiedAt,
    required this.kotaId,
    required this.pendidikanId,
    required this.prodiId,
    required this.skillId,
    required this.rememberToken,
    required this.tglDaftar,
    required this.tglPerubahanstatus,
    required this.keteranganDaftar,
    required this.statusDaftar,
    required this.userId,
    required this.posisiMagangId,
    required this.perusahaanId,
    required this.namaPosisi,
    required this.fotoPosisi,
    required this.persyaratanPosisi,
    required this.keteranganPosisi,
    required this.fasilitasPosisi,
    required this.deskripsiPosisi,
    required this.deadlinePosisi,
  });

  int id;
  String namaPerusahaan;
  String alamatPerusahaan;
  String fotoPerusahaan;
  String email;
  String password;
  String statusPerusahaan;
  String suratPerusahaan;
  String tglStatusperusahaan;
  String deskripsiPerusahaan;
  String notlpPerusahaan;
  String adminId;
  String createdAt;
  String updatedAt;
  String name;
  String alamatUser;
  String fotoUser;
  String cvUser;
  String notlpUser;
  dynamic emailVerifiedAt;
  String kotaId;
  String pendidikanId;
  String prodiId;
  String skillId;
  dynamic rememberToken;
  String tglDaftar;
  String tglPerubahanstatus;
  String keteranganDaftar;
  String statusDaftar;
  String userId;
  String posisiMagangId;
  String perusahaanId;
  String namaPosisi;
  String fotoPosisi;
  String persyaratanPosisi;
  String keteranganPosisi;
  String fasilitasPosisi;
  String deskripsiPosisi;
  String deadlinePosisi;

  factory PendaftaranModel.fromJson(Map<String, dynamic> json) =>
      PendaftaranModel(
        id: json["id"],
        namaPerusahaan: json["nama_perusahaan"],
        alamatPerusahaan: json["alamat_perusahaan"],
        fotoPerusahaan: json["foto_perusahaan"],
        email: json["email"],
        password: json["password"],
        statusPerusahaan: json["status_perusahaan"],
        suratPerusahaan: json["surat_perusahaan"],
        tglStatusperusahaan: json["tgl_statusperusahaan"],
        deskripsiPerusahaan: json["deskripsi_perusahaan"],
        notlpPerusahaan: json["notlp_perusahaan"],
        adminId: json["admin_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        name: json["name"],
        alamatUser: json["alamat_user"],
        fotoUser: json["foto_user"],
        cvUser: json["cv_user"],
        notlpUser: json["notlp_user"],
        emailVerifiedAt: json["email_verified_at"],
        kotaId: json["kota_id"],
        pendidikanId: json["pendidikan_id"],
        prodiId: json["prodi_id"],
        skillId: json["skill_id"],
        rememberToken: json["remember_token"],
        tglDaftar: json["tgl_daftar"],
        tglPerubahanstatus: json["tgl_perubahanstatus"],
        keteranganDaftar: json["keterangan_daftar"],
        statusDaftar: json["status_daftar"],
        userId: json["user_id"],
        posisiMagangId: json["posisi_magang_id"],
        perusahaanId: json["perusahaan_id"],
        namaPosisi: json["nama_posisi"],
        fotoPosisi: json["foto_posisi"],
        persyaratanPosisi: json["persyaratan_posisi"],
        keteranganPosisi: json["keterangan_posisi"],
        fasilitasPosisi: json["fasilitas_posisi"],
        deskripsiPosisi: json["deskripsi_posisi"],
        deadlinePosisi: json["deadline_posisi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_perusahaan": namaPerusahaan,
        "alamat_perusahaan": alamatPerusahaan,
        "foto_perusahaan": fotoPerusahaan,
        "email": email,
        "password": password,
        "status_perusahaan": statusPerusahaan,
        "surat_perusahaan": suratPerusahaan,
        "tgl_statusperusahaan": tglStatusperusahaan,
        "deskripsi_perusahaan": deskripsiPerusahaan,
        "notlp_perusahaan": notlpPerusahaan,
        "admin_id": adminId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "name": name,
        "alamat_user": alamatUser,
        "foto_user": fotoUser,
        "cv_user": cvUser,
        "notlp_user": notlpUser,
        "email_verified_at": emailVerifiedAt,
        "kota_id": kotaId,
        "pendidikan_id": pendidikanId,
        "prodi_id": prodiId,
        "skill_id": skillId,
        "remember_token": rememberToken,
        "tgl_daftar": tglDaftar,
        "tgl_perubahanstatus": tglPerubahanstatus,
        "keterangan_daftar": keteranganDaftar,
        "status_daftar": statusDaftar,
        "user_id": userId,
        "posisi_magang_id": posisiMagangId,
        "perusahaan_id": perusahaanId,
        "nama_posisi": namaPosisi,
        "foto_posisi": fotoPosisi,
        "persyaratan_posisi": persyaratanPosisi,
        "keterangan_posisi": keteranganPosisi,
        "fasilitas_posisi": fasilitasPosisi,
        "deskripsi_posisi": deskripsiPosisi,
        "deadline_posisi": deadlinePosisi
      };
}

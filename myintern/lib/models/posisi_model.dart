import 'package:myintern/models/perusahaan_model.dart';

class PosisiModel {
  int? id;
  String? nama_posisi;
  String? foto_posisi;
  String? persyaratan_posisi;
  String? keterangan_posisi;
  String? fasilitas_posisi;
  String? deskripsi_posisi;
  String? deadline_posisi;
  PerusahaanModel? perusahaan;
  PosisiModel({
    this.id,
    this.nama_posisi,
    this.foto_posisi,
    this.persyaratan_posisi,
    this.keterangan_posisi,
    this.fasilitas_posisi,
    this.deskripsi_posisi,
    this.deadline_posisi,
    this.perusahaan,
  });
  PosisiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_posisi = json['nama_posisi'];
    foto_posisi = json['foto_posisi'];
    persyaratan_posisi = json['persyaratan_posisi'];
    keterangan_posisi = json['keterangan_posisi'];
    fasilitas_posisi = json['fasilitas_posisi'];
    deskripsi_posisi = json['deskripsi_posisi'];
    deadline_posisi = json['deadline_posisi'];
    perusahaan = PerusahaanModel.fromJson(json['perusahaan']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_posisi': nama_posisi,
      'foto_posisi': foto_posisi,
      'persyaratan_posisi': persyaratan_posisi,
      'keterangan_posisi': keterangan_posisi,
      'fasilitas_posisi': fasilitas_posisi,
      'deskripsi_posisi': deskripsi_posisi,
      'deadline_posisi': deadline_posisi,
      'perusahaan': perusahaan!.toJson(),
    };
  }
}

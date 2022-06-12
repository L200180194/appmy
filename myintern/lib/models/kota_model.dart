import 'dart:convert';

KotaModel kotaModelFromJson(String str) => KotaModel.fromJson(json.decode(str));

String kotaModelToJson(KotaModel data) => json.encode(data.toJson());

class KotaModel {
  KotaModel({
    required this.id,
    required this.namaKota,
  });

  int id;
  String namaKota;

  factory KotaModel.fromJson(Map<String, dynamic> json) => KotaModel(
        id: json["id"],
        namaKota: json["nama_kota"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kota": namaKota,
      };
  @override
  String toString() => namaKota;
}

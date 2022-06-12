import 'dart:convert';

ProdiModel prodiModelFromJson(String str) =>
    ProdiModel.fromJson(json.decode(str));

String prodiModelToJson(ProdiModel data) => json.encode(data.toJson());

class ProdiModel {
  ProdiModel({
    required this.id,
    required this.namaProdi,
  });

  int id;
  String namaProdi;

  factory ProdiModel.fromJson(Map<String, dynamic> json) => ProdiModel(
        id: json["id"],
        namaProdi: json["nama_prodi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_prodi": namaProdi,
      };
  @override
  String toString() => namaProdi;
}

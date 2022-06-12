import 'dart:convert';

PendidikanModel pendidikanModelFromJson(String str) =>
    PendidikanModel.fromJson(json.decode(str));

String pendidikanModelToJson(PendidikanModel data) =>
    json.encode(data.toJson());

class PendidikanModel {
  PendidikanModel({
    required this.id,
    required this.tingkatPendidikan,
  });

  int id;
  String tingkatPendidikan;

  factory PendidikanModel.fromJson(Map<String, dynamic> json) =>
      PendidikanModel(
        id: json["id"],
        tingkatPendidikan: json["tingkat_pendidikan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tingkat_pendidikan": tingkatPendidikan,
      };
  @override
  String toString() => tingkatPendidikan;
}

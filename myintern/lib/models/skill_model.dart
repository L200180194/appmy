import 'dart:convert';

SkillModel skillModelFromJson(String str) =>
    SkillModel.fromJson(json.decode(str));

String skillModelToJson(SkillModel data) => json.encode(data.toJson());

class SkillModel {
  SkillModel({
    required this.id,
    required this.namaSkill,
  });

  int id;
  String namaSkill;

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json["id"],
        namaSkill: json["nama_skill"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_skill": namaSkill,
      };
  @override
  String toString() => namaSkill;
}

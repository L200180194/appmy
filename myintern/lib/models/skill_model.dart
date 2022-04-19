class SkillModel {
  int? id;
  String? nama_skill;
  SkillModel({this.id, this.nama_skill});
  SkillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_skill = json['nama_skill'];
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'nama_skill': nama_skill};
  }
}

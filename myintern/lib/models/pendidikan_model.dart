class PendidikanModel {
  int? id;
  String? tingkat_pendidikan;

  PendidikanModel({
    this.id,
    this.tingkat_pendidikan,
  });
  PendidikanModel.fromJson(Map<String, dynamic> json) {
    id = json[id];
    tingkat_pendidikan = json['tingkat_pendidikan'];
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'tingkat_pendidikan': tingkat_pendidikan};
  }
}

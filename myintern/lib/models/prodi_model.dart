class ProdiModel {
  int? id;
  String? nama_prodi;

  ProdiModel({this.id, this.nama_prodi});
  ProdiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_prodi = json['nama_prodi'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_prodi': nama_prodi,
    };
  }
}

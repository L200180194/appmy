class KotaModel {
  int? id;
  String? nama_kota;

  KotaModel({this.id, this.nama_kota});
  KotaModel.fomJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_kota = json['nama_kota'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_kota': nama_kota,
    };
  }
}

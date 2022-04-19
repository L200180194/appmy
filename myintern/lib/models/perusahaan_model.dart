class PerusahaanModel {
  int? id;
  String? nama_perusahaan;
  String? alamat_perusahaan;
  String? foto_perusahaan;
  String? email;
  String? status_perusahaan;
  String? notlp_perusahaan;
  String? deskripsi_perusahaan;
  PerusahaanModel({
    this.id,
    this.nama_perusahaan,
    this.alamat_perusahaan,
    this.foto_perusahaan,
    this.email,
    this.status_perusahaan,
    this.notlp_perusahaan,
    this.deskripsi_perusahaan,
  });
  PerusahaanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_perusahaan = json['nama_perusahaan'];
    alamat_perusahaan = json['alamat_perusahaan'];
    foto_perusahaan = json['foto_perusahaan'];
    email = json['email'];
    status_perusahaan = json['status_perusahaan'];
    notlp_perusahaan = json['notlp_perusahaan'];
    deskripsi_perusahaan = json['deskripsi_perusahaan'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_perusahaan': nama_perusahaan,
      'alamat_perusahaan': alamat_perusahaan,
      'foto_perusahaan': foto_perusahaan,
      'email': email,
      'status_perusahaan': status_perusahaan,
      'notlp_perusahaan': notlp_perusahaan,
      'deskripsi_perusahaan': deskripsi_perusahaan,
    };
  }
}

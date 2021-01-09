// To parse this JSON data, do
//
//     final museum = museumFromJson(jsonString);

import 'dart:convert';

Museum museumFromJson(String str) => Museum.fromJson(json.decode(str));

String museumToJson(Museum data) => json.encode(data.toJson());

class Museum {
  Museum({
    this.data,
  });

  List<Datum> data;

  factory Museum.fromJson(Map<String, dynamic> json) => Museum(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.museumId,
    this.kodePengelolaan,
    this.nama,
    this.sdm,
    this.alamatJalan,
    this.desaKelurahan,
    this.kecamatan,
    this.kabupatenKota,
    this.propinsi,
    this.lintang,
    this.bujur,
    this.koleksi,
    this.sumberDana,
    this.pengelola,
    this.tipe,
    this.standar,
    this.tahunBerdiri,
    this.bangunan,
    this.luasTanah,
    this.statusKepemilikan,
  });

  String museumId;
  String kodePengelolaan;
  String nama;
  String sdm;
  String alamatJalan;
  String desaKelurahan;
  String kecamatan;
  String kabupatenKota;
  String propinsi;
  String lintang;
  String bujur;
  String koleksi;
  String sumberDana;
  String pengelola;
  String tipe;
  String standar;
  String tahunBerdiri;
  String bangunan;
  String luasTanah;
  dynamic statusKepemilikan;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    museumId: json["museum_id"],
    kodePengelolaan: json["kode_pengelolaan"],
    nama: json["nama"],
    sdm: json["sdm"],
    alamatJalan: json["alamat_jalan"],
    desaKelurahan: json["desa_kelurahan"],
    kecamatan: json["kecamatan"],
    kabupatenKota: json["kabupaten_kota"],
    propinsi: json["propinsi"],
    lintang: json["lintang"],
    bujur: json["bujur"],
    koleksi: json["koleksi"],
    sumberDana: json["sumber_dana"],
    pengelola: json["pengelola"],
    tipe: json["tipe"],
    standar: json["standar"],
    tahunBerdiri: json["tahun_berdiri"],
    bangunan: json["bangunan"],
    luasTanah: json["luas_tanah"],
    statusKepemilikan: json["status_kepemilikan"],
  );

  Map<String, dynamic> toJson() => {
    "museum_id": museumId,
    "kode_pengelolaan": kodePengelolaan,
    "nama": nama,
    "sdm": sdm,
    "alamat_jalan": alamatJalan,
    "desa_kelurahan": desaKelurahan,
    "kecamatan": kecamatan,
    "kabupaten_kota": kabupatenKota,
    "propinsi": propinsi,
    "lintang": lintang,
    "bujur": bujur,
    "koleksi": koleksi,
    "sumber_dana": sumberDana,
    "pengelola": pengelola,
    "tipe": tipe,
    "standar": standar,
    "tahun_berdiri": tahunBerdiri,
    "bangunan": bangunan,
    "luas_tanah": luasTanah,
    "status_kepemilikan": statusKepemilikan,
  };
}

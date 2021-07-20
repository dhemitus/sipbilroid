import 'package:equatable/equatable.dart';

enum VehicleStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class VehicleModel extends Equatable {
  final int? id, kendaraanId;
  final int? totalKlaim, sisaAnggaranBulanan, anggaranBulanan, nilaiAnggaran;
  final String? tipeKendaraan, jenisKendaraan, eselon, nomorPolisi, message;
  final List<VehicleModel>? list;

  VehicleModel({
    this.nomorPolisi = '',
    this.eselon = '',
    this.jenisKendaraan = '',
    this.tipeKendaraan = '',
    this.message = '',
    this.nilaiAnggaran,
    this.anggaranBulanan,
    this.sisaAnggaranBulanan,
    this.totalKlaim,
    this.kendaraanId,
    this.id,
    this.list
  });

  VehicleModel copyWith({
    String? nomorPolisi,
    String? eselon,
    String? jenisKendaraan,
    String? tipeKendaraan,
    String? message,
    int? nilaiAnggaran,
    int? anggaranBulanan,
    int? sisaAnggaranBulanan,
    int? totalKlaim,
    int? kendaraanId,
    int? id,
    List<VehicleModel>? list
  }) => VehicleModel(
    nomorPolisi: nomorPolisi ?? this.nomorPolisi,
    eselon: eselon ?? this.eselon,
    jenisKendaraan: jenisKendaraan ?? this.jenisKendaraan,
    tipeKendaraan: tipeKendaraan ?? this.tipeKendaraan,
    message: message ?? this.message,
    nilaiAnggaran: nilaiAnggaran ?? this.nilaiAnggaran,
    anggaranBulanan: anggaranBulanan ?? this.anggaranBulanan,
    sisaAnggaranBulanan: sisaAnggaranBulanan ?? this.sisaAnggaranBulanan,
    totalKlaim: totalKlaim ?? this.totalKlaim,
    kendaraanId: kendaraanId ?? this.kendaraanId,
    id: id ?? this.id,
    list: list ?? this.list
  );

  factory VehicleModel.fromJsonList(list) {
    List<VehicleModel> _list = [];
    list.map((_item) => _list.add(VehicleModel.fromJson(_item))).toList();

    return VehicleModel(list: _list);
  }

  factory VehicleModel.fromJson(_json) => VehicleModel(
    nomorPolisi: _json['nomor_polisi'] ?? null,
    eselon: _json['eselon'] ?? null,
    jenisKendaraan: _json['jenis_kendaraan'] ?? null,
    tipeKendaraan: _json['tipe_kendaraan'] ?? null,
    nilaiAnggaran: _json['nilai_anggaran'] ?? null,
    anggaranBulanan: _json['anggaran_bulanan'] ?? null,
    sisaAnggaranBulanan: _json['sisa_anggaran_bulanan'] ?? null,
    totalKlaim: _json['total_klaim'] ?? null,
    kendaraanId: _json['kendaraan_id'] ?? null,
    id: _json['id'] ?? null
  );

  Map<String, dynamic> toParam() => {
    'kendaraan_id': kendaraanId
  };

  @override
  List<Object?> get props => [id,
    kendaraanId,
    totalKlaim,
    sisaAnggaranBulanan,
    anggaranBulanan,
    nilaiAnggaran,
    tipeKendaraan,
    jenisKendaraan,
    eselon,
    nomorPolisi,
    list
  ];
}

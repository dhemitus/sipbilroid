import 'package:equatable/equatable.dart';

enum VehicleStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class VehicleModel extends Equatable {
  final int? id, kendaraanId;
  final double? totalKlaim, sisaAnggaranBulanan, anggaranBulanan, nilaiAnggaran;
  final String? tipeKendaraan, jenisKendaraan, eselon, nomorPolisi, message;

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
    this.id
  });

  VehicleModel copyWith({
    String? nomorPolisi,
    String? eselon,
    String? jenisKendaraan,
    String? tipeKendaraan,
    String? message,
    double? nilaiAnggaran,
    double? anggaranBulanan,
    double? sisaAnggaranBulanan,
    double? totalKlaim,
    int? kendaraanId,
    int? id
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
    id: id ?? this.id
  );

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
    nomorPolisi
  ];
}

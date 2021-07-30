import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';

enum ClaimStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class ClaimModel extends Equatable {
  final DateTime? createdAt, updatedAt, tanggalKlaim;
  final int? id, satkerId, penggunakendaraan, penggunaId, kendaraanId;
  final int? total;
  final double? jumlahLiter;
  final String? createdBy, updatedBy, noKlaim, pengguna, nomorPolisi, status, lokasi, jenisBbm, struk, receipt, catatan, message;
  final List<ClaimModel>? list;

  ClaimModel({
    this.message,
    this.catatan,
    this.receipt,
    this.struk,
    this.jenisBbm,
    this.lokasi,
    this.status,
    this.nomorPolisi,
    this.pengguna,
    this.noKlaim,
    this.updatedBy,
    this.createdBy,
    this.total,
    this.jumlahLiter,
    this.kendaraanId,
    this.penggunaId,
    this.penggunakendaraan,
    this.satkerId,
    this.id,
    this.tanggalKlaim,
    this.updatedAt,
    this.createdAt,
    this.list
  });

  copyWith({
    String? message,
    String? catatan,
    String? receipt,
    String? struk,
    String? jenisBbm,
    String? lokasi,
    String? status,
    String? nomorPolisi,
    String? pengguna,
    String? noKlaim,
    String? updatedBy,
    String? createdBy,
    int? total,
    double? jumlahLiter,
    int? kendaraanId,
    int? penggunaId,
    int? penggunakendaraan,
    int? satkerId,
    int? id,
    DateTime? tanggalKlaim,
    DateTime? updatedAt,
    DateTime? createdAt,
    List<ClaimModel>? list
  }) => ClaimModel(
    message: message ?? this.message,
    catatan: catatan ?? this.catatan,
    receipt: receipt ?? this.receipt,
    struk: struk ?? this.struk,
    jenisBbm: jenisBbm ?? this.jenisBbm,
    lokasi: lokasi ?? this.lokasi,
    status: status ?? this.status,
    nomorPolisi: nomorPolisi ?? this.nomorPolisi,
    pengguna: pengguna ?? this.pengguna,
    noKlaim: noKlaim ?? this.noKlaim,
    updatedBy: updatedBy ?? this.updatedBy,
    createdBy: createdBy ?? this.createdBy,
    total: total ?? this.total,
    jumlahLiter: jumlahLiter ?? this.jumlahLiter,
    kendaraanId: kendaraanId ?? this.kendaraanId,
    penggunaId: penggunaId ?? this.penggunaId,
    penggunakendaraan: penggunakendaraan ?? this.penggunakendaraan,
    satkerId: satkerId ?? this.satkerId,
    id: id ?? this.id,
    tanggalKlaim: tanggalKlaim ?? this.tanggalKlaim,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    list: list ?? this.list
  );

  factory ClaimModel.fromJsonList(list) {
    List<ClaimModel> _list = [];
    list.map((_item) => _list.add(ClaimModel.fromJson(_item)) ).toList();

    return ClaimModel(list: _list);
  }

  factory ClaimModel.fromJson(_json) => ClaimModel(
    message: _json['message'] ?? null,
    catatan: _json['catatan'] ?? null,
    receipt: _json['receipt'] ?? null,
    struk: _json['struk'] ?? null,
    jenisBbm: _json['jenis_bbm'] ?? null,
    lokasi: _json['lokasi'] ?? null,
    status: _json['status'] ?? null,
    nomorPolisi: _json['nomor_polisi'] ?? null,
    pengguna: _json['pengguna'] ?? null,
    noKlaim: _json['no_klaim'] ?? null,
    updatedBy: _json['updatedBy'] ?? null,
    createdBy: _json['createdBy'] ?? null,
    total: _json['total'] ?? null,
    jumlahLiter: _json['jumlah_liter'].toDouble() ?? null,
    kendaraanId: _json['kendaraan_id'] ?? null,
    penggunaId: _json['pengguna_id'] ?? null,
    penggunakendaraan: _json['penggunakendaraan'] ?? null,
    satkerId: _json['satker_id'] ?? null,
    id: _json['id'] ?? null,
    tanggalKlaim: _json['tanggal_klaim'] != null ? DateTime.parse(_json['tanggal_klaim']) : null,
    updatedAt: _json['updatedAt'] != null ? DateTime.parse(_json['updatedAt']) : null,
    createdAt: _json['createdAt'] != null ? DateTime.parse(_json['createdAt']) : null
  );

  Map<String, dynamic> toDetail() => {
    'id': jsonEncode(id)
  };

  Map<String, dynamic> toClaim() => {
    'kendaraan_id': kendaraanId!,
    'tanggal_klaim': DateFormat('yyyy-mm-dd').format(tanggalKlaim!),
    'lokasi': lokasi!,
    'jenis_bbm': jenisBbm!,
    'jumlah_liter': jumlahLiter!,
    'total': total!,
    'receipt': receipt!
  };

  @override
  List<Object?> get props => [
    message,
    catatan,
    receipt,
    struk,
    jenisBbm,
    lokasi,
    status,
    nomorPolisi,
    pengguna,
    noKlaim,
    updatedBy,
    createdBy,
    total,
    jumlahLiter,
    kendaraanId,
    penggunaId,
    penggunakendaraan,
    satkerId,
    id,
    tanggalKlaim,
    updatedAt,
    createdAt,
    list
  ];
}

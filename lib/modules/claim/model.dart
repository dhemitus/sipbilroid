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
  final double? jumlahLiter, total;
  final String? createdBy, updatedBy, noKlaim, pengguna, nomorPolisi, status, lokasi, jenisBbm, struk, receipt, catatan, message;

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
    this.createdAt
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
    double? total,
    double? jumlahLiter,
    int? kendaraanId,
    int? penggunaId,
    int? penggunakendaraan,
    int? satkerId,
    int? id,
    DateTime? tanggalKlaim,
    DateTime? updatedAt,
    DateTime? createdAt
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
    createdAt: createdAt ?? this.createdAt
  );


  @override
  List<Object?> get props => [];
}

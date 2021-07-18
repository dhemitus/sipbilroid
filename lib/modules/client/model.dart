import 'package:equatable/equatable.dart';

enum ClientStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class ClientModel extends Equatable {
  final int? id, status, satkerId;
  final String? name, phone, nik, eselon, satker, message;

  ClientModel({
    this.message,
    this.satker,
    this.eselon,
    this.nik,
    this.phone,
    this.name,
    this.satkerId,
    this.status,
    this.id
  });

  copyWith({
    String? message,
    String? satker,
    String? eselon,
    String? nik,
    String? phone,
    String? name,
    int? satkerId,
    int? status,
    int? id
  }) => ClientModel(
    message:  message ?? this.message,
    satker: satker ?? this.satker,
    eselon: eselon ?? this.eselon,
    nik: nik ?? this.nik,
    phone: phone ?? this.phone,
    name: name ?? this.name,
    satkerId: satkerId ?? this.satkerId,
    status: status ?? this.status,
    id: id ?? this.id
  );

  factory ClientModel.fromJson(_json) => ClientModel(
    message: _json['message'] ?? null,
    satker: _json['satker'] ?? null,
    eselon: _json['eselon'] ?? null,
    nik: _json['nik'] ?? null,
    phone: _json['phone'] ?? null,
    name: _json['name'] ?? null,
    satkerId: _json['satker_id'] ?? null,
    status: _json['status'] ?? null,
    id: _json['id'] ?? null
  );

  @override
  List<Object?> get props => [message, satker, eselon, nik, phone, name, satkerId, status, id];
}

import 'package:equatable/equatable.dart';

enum DashboardStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class DashboardModel extends Equatable {
  final int? jumlahKlaim;
  final int? totalKlaim;
  final String? bulan, message;
  final DashboardModel? monthly, annual;

  DashboardModel({
    this.bulan,
    this.message,
    this.totalKlaim,
    this.jumlahKlaim,
    this.annual,
    this.monthly
  });

  DashboardModel copyWith({
    String? bulan,
    String? message,
    int? totalKlaim,
    int? jumlahKlaim,
    DashboardModel? monthly,
    DashboardModel? annual
  }) => DashboardModel(
    bulan: bulan ?? this.bulan,
    message: message ?? this.message,
    totalKlaim: totalKlaim ?? this.totalKlaim,
    jumlahKlaim: jumlahKlaim ?? this.jumlahKlaim,
    monthly: monthly ?? this.monthly,
    annual: annual ?? this.annual
  );

  factory DashboardModel.fromJson(_json) => DashboardModel(
    bulan: _json['bulan'] ?? null,
    totalKlaim: _json['total_klaim'] ?? null,
    jumlahKlaim: _json['jumlah_klaim'] ?? null
  );

  @override
  List<Object?> get props => [bulan, message, totalKlaim, jumlahKlaim, annual, monthly];
}

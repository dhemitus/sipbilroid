import 'package:equatable/equatable.dart';

enum DashboardStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class DashboardModel extends Equatable {
  final int? jumlahKlaim;
  final double? totalKlaim;
  final String? bulan, message;

  DashboardModel({
    this.bulan,
    this.message,
    this.totalKlaim,
    this.jumlahKlaim,
  });

  copyWith({
    String? bulan,
    String? message,
    double? totalKlaim,
    int? jumlahKlaim
  }) => DashboardModel(
    bulan: bulan ?? this.bulan,
    message: message ?? this.message,
    totalKlaim: totalKlaim ?? this.totalKlaim,
    jumlahKlaim: jumlahKlaim ?? this.jumlahKlaim
  );

  @override
  List<Object?> get props => [bulan, message, totalKlaim, jumlahKlaim];
}

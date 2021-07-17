import 'package:equatable/equatable.dart';

enum GasolineStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class GasolineModel extends Equatable {
  final int? id;
  final String? deskripsi, message;

  GasolineModel({this.message, this.deskripsi, this.id});

  copyWith({
    String? message,
    String? deskripsi,
    int? id
  }) => GasolineModel(
    message: message ?? this.message,
    deskripsi: deskripsi ?? this.deskripsi,
    id: id ?? this.id
  );

  @override
  List<Object?> get props => [message, deskripsi, id];
}

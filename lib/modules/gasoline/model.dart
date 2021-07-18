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
  final List<GasolineModel>? list;

  GasolineModel({this.message, this.deskripsi, this.id, this.list});

  GasolineModel copyWith({
    String? message,
    String? deskripsi,
    int? id,
    List<GasolineModel>? list
  }) => GasolineModel(
    message: message ?? this.message,
    deskripsi: deskripsi ?? this.deskripsi,
    id: id ?? this.id,
    list: list ?? this.list
  );

  factory GasolineModel.fromJsonList(list) {
    print(list);
    List<GasolineModel> _list = [];
    list.map((_item) => _list.add(GasolineModel.fromJson(_item)) ).toList();
    return GasolineModel(list: _list);
  }

  factory GasolineModel.fromJson(_json) => GasolineModel(
    id: _json['id'] ?? null,
    deskripsi: _json['deskripsi'] ?? null
  );

  @override
  List<Object?> get props => [message, deskripsi, id];
}

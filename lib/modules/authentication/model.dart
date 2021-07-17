import 'dart:convert';
import 'package:equatable/equatable.dart';

enum AuthenticationStatus {
  INIT,
  LOADING,
  ERROR,
  DONE
}

class AuthenticationModel extends Equatable {
  final String? phone, password, newPassword, token, refreshToken, status, message;

  AuthenticationModel({
    this.message,
    this.status,
    this.refreshToken,
    this.phone,
    this.password,
    this.newPassword,
    this.token
  });

  @override
  List<Object?> get props => [phone, password, newPassword, token, refreshToken, status, message];
  Map<String, String> toLogin() => {
    'phone': phone!,
    'password': password!
  };

  AuthenticationModel copyWith({
    String? message,
    String? status,
    String? refreshToken,
    String? phone,
    String? password,
    String? newPassword,
    String? token
  }) => AuthenticationModel(
    message: message ?? this.message,
    status: status ?? this.status,
    refreshToken: refreshToken ?? this.refreshToken,
    phone: phone ?? this.phone,
    password: password ?? this.password,
    newPassword: newPassword ?? this.newPassword,
    token: token ?? this.token
  );

  Map<String, String> toChange() => {
    'password': password!,
    'new_password': newPassword!
  };

  Map<String, String?> toJson() => {
    'password': password ?? null,
    'new_password': newPassword ?? null,
    'status': status ?? null,
    'token': token ?? null,
    'refreshToken': refreshToken ?? null,
    'phone': phone ?? null
  };

  String get authorization => 'Bearer $token';

  factory AuthenticationModel.fromJson(Map<String, String> _json) => AuthenticationModel(
    message: _json['message'] ?? null,
    status: _json['status'] ?? null,
    refreshToken: _json['refreshToken'] ?? null,
    phone: _json['phone'] ?? null,
    password: _json['password'] ?? null,
    newPassword: _json['new_password'] ?? null,
    token: _json['token'] ?? null
  );

  factory AuthenticationModel.fromString(String _string) => AuthenticationModel.fromJson(jsonDecode(_string));

}

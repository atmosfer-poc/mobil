
import 'dart:convert';

class LoginRequestModel {
  String username;
  String password;
  String? otp;
  LoginRequestModel({
    required this.username,
    required this.password,
    this.otp,
  });

  LoginRequestModel copyWith({
    String? username,
    String? password,
    String? otp,
  }) {
    return LoginRequestModel(
      username: username ?? this.username,
      password: password ?? this.password,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'password': password});
    if (otp != null) {
      result.addAll({'otp': otp});
    }

    return result;
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      otp: map['otp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) => LoginRequestModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRegisterRequestModel(username: $username, password: $password, otp: $otp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginRequestModel && other.username == username && other.password == password && other.otp == otp;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ otp.hashCode;
}

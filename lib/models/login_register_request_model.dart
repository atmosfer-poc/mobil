import 'dart:convert';

class LoginRegisterRequestModel {
  String username;
  String password;
  String? otp;
  LoginRegisterRequestModel({
    required this.username,
    required this.password,
    this.otp,
  });

  LoginRegisterRequestModel copyWith({
    String? username,
    String? password,
    String? otp,
  }) {
    return LoginRegisterRequestModel(
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

  factory LoginRegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRegisterRequestModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      otp: map['otp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRegisterRequestModel.fromJson(String source) => LoginRegisterRequestModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRegisterRequestModel(username: $username, password: $password, otp: $otp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginRegisterRequestModel && other.username == username && other.password == password && other.otp == otp;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ otp.hashCode;
}

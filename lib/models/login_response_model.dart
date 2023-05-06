import 'dart:convert';

import 'package:flutter/foundation.dart';

class LoginResponseModel {
  bool requireOtp;
  String? accessToken;
  String? refreshToken;
  int? accessTokenExpirationDate;
  List<String>? scope;
  String? type;
  bool mustEula;
  LoginResponseModel({
    required this.requireOtp,
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpirationDate,
    this.scope,
    this.type,
    required this.mustEula,
  });

  LoginResponseModel copyWith({
    bool? requireOtp,
    String? accessToken,
    String? refreshToken,
    int? accessTokenExpirationDate,
    List<String>? scope,
    String? type,
    bool? mustEula,
  }) {
    return LoginResponseModel(
      requireOtp: requireOtp ?? this.requireOtp,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      accessTokenExpirationDate: accessTokenExpirationDate ?? this.accessTokenExpirationDate,
      scope: scope ?? this.scope,
      type: type ?? this.type,
      mustEula: mustEula ?? this.mustEula,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'requireOtp': requireOtp});
    if (accessToken != null) {
      result.addAll({'accessToken': accessToken});
    }
    if (refreshToken != null) {
      result.addAll({'refreshToken': refreshToken});
    }
    if (accessTokenExpirationDate != null) {
      result.addAll({'accessTokenExpirationDate': accessTokenExpirationDate});
    }
    if (scope != null) {
      result.addAll({'scope': scope});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    result.addAll({'mustEula': mustEula});

    return result;
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      requireOtp: map['requireOtp'] ?? false,
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
      accessTokenExpirationDate: map['accessTokenExpirationDate']?.toInt(),
      scope: map['scope'] != null ? List<String>.from(map['scope']) : null,
      type: map['type'],
      mustEula: map['mustEula'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) => LoginResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginResponseModel(requireOtp: $requireOtp, accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpirationDate: $accessTokenExpirationDate, scope: $scope, type: $type, mustEula: $mustEula)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseModel &&
        other.requireOtp == requireOtp &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.accessTokenExpirationDate == accessTokenExpirationDate &&
        listEquals(other.scope, scope) &&
        other.type == type &&
        other.mustEula == mustEula;
  }

  @override
  int get hashCode {
    return requireOtp.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode ^
        accessTokenExpirationDate.hashCode ^
        scope.hashCode ^
        type.hashCode ^
        mustEula.hashCode;
  }
}

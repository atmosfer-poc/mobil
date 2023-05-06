import 'dart:convert';

class ForgotPasswordRequestModel {
  String email;
  ForgotPasswordRequestModel({
    required this.email,
  });

  ForgotPasswordRequestModel copyWith({
    String? email,
  }) {
    return ForgotPasswordRequestModel(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});

    return result;
  }

  factory ForgotPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return ForgotPasswordRequestModel(
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgotPasswordRequestModel.fromJson(String source) => ForgotPasswordRequestModel.fromMap(json.decode(source));

  @override
  String toString() => 'ForgotPasswordRequestModel(email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForgotPasswordRequestModel && other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}

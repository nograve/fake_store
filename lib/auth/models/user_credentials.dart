import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials.freezed.dart';
part 'user_credentials.g.dart';

@freezed
class UserCredentials with _$UserCredentials {
  const factory UserCredentials({
    required String username,
    required String password,
  }) = _UserCredentials;

  factory UserCredentials.fromJson(Map<String, Object?> json) =>
      _$UserCredentialsFromJson(json);
}

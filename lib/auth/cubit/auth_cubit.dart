import 'package:fake_store/auth/models/token.dart';

import '../models/user_credentials.dart';
import '../repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  final AuthRepo _authRepo = AuthRepoImpl();

  Future<void> auth(UserCredentials userCredentials) async {
    emit(const AuthState.initial());
    try {
      final Token? token = await _authRepo.auth(userCredentials);
      if (token != null) {
        emit(const AuthState.success());
      } else {
        throw 'Failed to log in.';
      }
    } catch (e) {
      emit(const AuthState.failure());
    }
  }
}

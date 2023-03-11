import 'package:fake_store/auth/repositories/auth_repo.dart';
import 'package:fake_store/auth/viewmodels/auth_viewmodel.dart';

import '../models/token.dart';

import '../models/user_credentials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  final AuthViewModel _authViewModel = AuthViewModel(repo: AuthRepoImpl());

  Future<void> auth(UserCredentials userCredentials) async {
    emit(const AuthState.initial());
    try {
      final Token? token = await _authViewModel.auth(userCredentials);
      if (token != null) {
        emit(const AuthState.success());
      } else {
        throw 'Failed to log in. Wrong username or password.';
      }
    } catch (e) {
      emit(AuthState.failure(e.toString()));
    }
  }
}

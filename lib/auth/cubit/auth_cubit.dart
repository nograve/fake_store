import 'package:fake_store/auth/viewmodels/auth_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../models/token.dart';

import '../models/user_credentials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  Future<void> auth(UserCredentials userCredentials) async {
    emit(const AuthState.initial());
    try {
      final Token? token =
          await GetIt.instance<AuthViewModel>().repo.auth(userCredentials);
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

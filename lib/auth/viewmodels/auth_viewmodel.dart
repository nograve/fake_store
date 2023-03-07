import '../models/token.dart';

import '../repositories/auth_repo.dart';
import 'package:flutter/foundation.dart';

import '../models/user_credentials.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required this.repo,
  });

  final AuthRepo repo;

  Future<Token?> auth(UserCredentials userCredentials) {
    return repo.auth(userCredentials);
  }
}

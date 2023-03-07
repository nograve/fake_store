import 'package:flutter/foundation.dart';

import '../models/token.dart';
import '../models/user_credentials.dart';
import '../repositories/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required this.repo,
  });

  final AuthRepo repo;

  Future<Token?> auth(UserCredentials userCredentials) {
    return repo.auth(userCredentials);
  }
}

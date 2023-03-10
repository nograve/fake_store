import 'package:get_it/get_it.dart';

import '../../shared/services/fake_store_client.dart';
import '../models/token.dart';
import '../models/user_credentials.dart';

abstract class AuthRepo {
  Future<Token?> auth(UserCredentials userCredentials);
}

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Token?> auth(userCredentials) {
    return GetIt.instance<FakeStoreClient>().auth(userCredentials);
  }
}

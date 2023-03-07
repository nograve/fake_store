import 'package:get_it/get_it.dart';

import '../../shared/services/fake_store_client.dart';
import '../models/product.dart';

abstract class HomeRepo {
  Future<List<Product>> getProducts();
}

class HomeRepoImpl extends HomeRepo {
  @override
  Future<List<Product>> getProducts() {
    return GetIt.instance<FakeStoreClient>().getProducts();
  }
}

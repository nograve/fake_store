import '../repositories/home_repo.dart';
import 'package:flutter/foundation.dart';

import '../models/product.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required this.homeRepo,
  });

  final HomeRepo homeRepo;

  Future<List<Product>> getProducts() {
    return homeRepo.getProducts();
  }
}

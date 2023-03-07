import 'package:dio/dio.dart';
import '../../auth/models/token.dart';
import 'package:retrofit/retrofit.dart';

import '../../auth/models/user_credentials.dart';
import '../../home/models/product.dart';

part 'fake_store_client.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class FakeStoreClient {
  factory FakeStoreClient(Dio dio, {String baseUrl}) = _FakeStoreClient;

  @GET('/products')
  Future<List<Product>> getProducts();

  @POST('/auth/login')
  Future<Token?> auth(@Body() UserCredentials userCredentials);
}

import 'package:fake_store/home/models/product.dart';
import 'package:fake_store/auth/models/user_credentials.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'fake_store_client.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class FakeStoreClient {
  factory FakeStoreClient(Dio dio, {String baseUrl}) = _FakeStoreClient;

  @GET('/products')
  Future<List<Product>> getProducts();

  @POST('/auth/login')
  Future<String?> auth(@Body() UserCredentials userCredentials);
}

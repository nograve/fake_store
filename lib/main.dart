import 'package:dio/dio.dart';
import 'package:fake_store/home/views/home_view.dart';
import 'auth/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'shared/services/fake_store_client.dart';

void main() {
  final dio = Dio();
  GetIt.instance.registerSingleton<FakeStoreClient>(FakeStoreClient(dio));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'auth',
      routes: {
        'auth': (context) => const AuthView(),
        'home': (context) => const HomePage(),
      },
    );
  }
}

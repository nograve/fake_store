import 'package:dio/dio.dart';
import 'package:fake_store/home/views/home_view.dart';
import 'auth/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'shared/services/fake_store_client.dart';

const int customPrimaryValue = 0xFF158a8a;
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
      title: 'Fake Store',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: const MaterialColor(
          customPrimaryValue,
          {
            50: Color(customPrimaryValue),
            100: Color(customPrimaryValue),
            200: Color(customPrimaryValue),
            300: Color(customPrimaryValue),
            400: Color(customPrimaryValue),
            500: Color(customPrimaryValue),
            600: Color(customPrimaryValue),
            700: Color(customPrimaryValue),
            800: Color(customPrimaryValue),
            900: Color(customPrimaryValue),
          },
        ),
      ),
      initialRoute: 'auth',
      routes: {
        'auth': (context) => const AuthView(),
        'home': (context) => const HomePage(),
      },
    );
  }
}

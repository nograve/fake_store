import 'package:dio/dio.dart';
import 'package:fake_store/auth/repositories/auth_repo.dart';
import 'package:fake_store/auth/viewmodels/auth_viewmodel.dart';
import 'package:fake_store/home/repositories/home_repo.dart';
import 'package:fake_store/home/viewmodels/home_viewmodel.dart';
import 'home/views/home_view.dart';
import 'shared/utils/color_primary_value.dart';
import 'auth/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'shared/services/fake_store_client.dart';

// TODO: Add more tests

void main() {
  final dio = Dio();
  GetIt.instance.registerSingleton<FakeStoreClient>(FakeStoreClient(dio));
  GetIt.instance
      .registerSingleton<AuthViewModel>(AuthViewModel(repo: AuthRepoImpl()));
  GetIt.instance.registerSingleton<HomeViewModel>(
      HomeViewModel(homeRepo: HomeRepoImpl()));
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
          colorPrimaryValue,
          {
            50: Color(colorPrimaryValue),
            100: Color(colorPrimaryValue),
            200: Color(colorPrimaryValue),
            300: Color(colorPrimaryValue),
            400: Color(colorPrimaryValue),
            500: Color(colorPrimaryValue),
            600: Color(colorPrimaryValue),
            700: Color(colorPrimaryValue),
            800: Color(colorPrimaryValue),
            900: Color(colorPrimaryValue),
          },
        ),
      ),
      initialRoute: 'auth',
      routes: {
        'auth': (context) => const AuthView(
              key: Key('auth_view'),
            ),
        'home': (context) => const HomeView(
              key: Key('home_view'),
            ),
      },
    );
  }
}

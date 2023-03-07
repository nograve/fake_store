import '../components/app_logo.dart';
import '../cubit/auth_cubit.dart';
import '../models/user_credentials.dart';
import '../../shared/utils/color_primary_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => AuthCubit(),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Fluttertoast.showToast(msg: 'Success!');
                Navigator.popAndPushNamed(context, 'home');
              },
              failure: (String errorMsg) =>
                  Fluttertoast.showToast(msg: errorMsg),
              orElse: () {},
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 80.0,
                  ),
                  child: const AppLogo(),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(colorPrimaryValue),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(colorPrimaryValue),
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(colorPrimaryValue),
                              ),
                            ),
                            labelText: 'User name',
                          ),
                          validator: (username) {
                            if (username != null && username.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          onSaved: (newUsername) {
                            _username = newUsername!.trim();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(colorPrimaryValue),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(colorPrimaryValue),
                              ),
                            ),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(colorPrimaryValue),
                              ),
                            ),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: (password) {
                            if (password != null && password.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onSaved: (newPassword) {
                            _password = newPassword!.trim();
                          },
                        ),
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const CircularProgressIndicator(),
                            orElse: () => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 50.0,
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: MaterialStatePropertyAll(
                                    Size(
                                      MediaQuery.of(context).size.width * 0.85,
                                      MediaQuery.of(context).size.height *
                                          0.065,
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    final UserCredentials userCredentials =
                                        UserCredentials(
                                      username: _username!,
                                      password: _password!,
                                    );
                                    context
                                        .read<AuthCubit>()
                                        .auth(userCredentials);
                                  }
                                },
                                child: const Text('Log in'),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

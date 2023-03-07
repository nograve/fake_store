import 'package:fake_store/auth/cubit/auth_cubit.dart';
import 'package:fake_store/auth/models/user_credentials.dart';
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
              failure: () => Fluttertoast.showToast(msg: 'Failed to log in.'),
              orElse: () {},
            );
          },
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
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
                  TextFormField(
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
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
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () => const CircularProgressIndicator(),
                        orElse: () => ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              final UserCredentials userCredentials =
                                  UserCredentials(
                                username: _username!,
                                password: _password!,
                              );
                              context.read<AuthCubit>().auth(userCredentials);
                            }
                          },
                          child: const Text('Login'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

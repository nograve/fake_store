import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'eComerce',
      style: TextStyle(
        fontFamily: 'Prata',
        fontSize: 46.48,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

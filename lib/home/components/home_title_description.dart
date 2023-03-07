import 'package:flutter/material.dart';

class HomeTitleDescription extends StatelessWidget {
  const HomeTitleDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'The best prices',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
      ),
    );
  }
}

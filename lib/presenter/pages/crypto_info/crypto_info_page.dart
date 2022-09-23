import 'package:flutter/material.dart';

import 'widgets/body_info_page.dart';

class CryptoInfoPage extends StatelessWidget {
  const CryptoInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Detalhes',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const BodyInfoPage(),
    );
  }
}

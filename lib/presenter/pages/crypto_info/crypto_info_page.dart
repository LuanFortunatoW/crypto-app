import 'package:crypto_app/presenter/pages/crypto_info/details_args.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/body_info_page.dart';

class CryptoInfoPage extends HookConsumerWidget {
  const CryptoInfoPage({Key? key, required this.args}) : super(key: key);
  final CryptoInfoArgs args;

  @override
  Widget build(BuildContext context, WidgetRef) {
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
      body: BodyInfoPage(
        args: args,
      ),
    );
  }
}

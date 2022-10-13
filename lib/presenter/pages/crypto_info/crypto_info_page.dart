import 'package:crypto_app/shared/widgets/app_bar_app.dart';

import 'details_args.dart';
import 'package:flutter/material.dart';

import 'widgets/body_info_page.dart';

class CryptoInfoPage extends StatelessWidget {
  const CryptoInfoPage({Key? key, required this.args}) : super(key: key);
  final CryptoInfoArgs args;
  static const route = '/crypto_info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarApp(
        title: 'Detalhes',
        visibility: true,
      ),
      body: BodyInfoPage(
        args: args,
      ),
    );
  }
}

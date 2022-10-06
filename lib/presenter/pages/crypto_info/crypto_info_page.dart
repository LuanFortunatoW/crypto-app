import 'package:crypto_app/l10n/app_localizations.dart';

import '../../../shared/widgets/button_change_visibility.dart';
import 'package:flutter/material.dart';

import 'crypto_info_args.dart';
import 'widgets/body_info_page.dart';

class CryptoInfoPage extends StatelessWidget {
  const CryptoInfoPage({Key? key, required this.args}) : super(key: key);
  final CryptoInfoArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          AppLocalizations.of(context)!.details,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: ButtonChangeVisibility(),
          ),
        ],
      ),
      body: BodyInfoPage(
        args: args,
      ),
    );
  }
}

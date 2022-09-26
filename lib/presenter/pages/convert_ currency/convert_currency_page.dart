import 'package:crypto_app/presenter/pages/convert_%20currency/convert_currency_args.dart';
import 'package:flutter/material.dart';

import 'widgets/body_convert_currency.dart';

class ConvertCurrencyPage extends StatelessWidget {
  const ConvertCurrencyPage({Key? key, required this.args}) : super(key: key);

  final ConvertCurrencyArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Converter Moeda',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BodyConverCurrencyPage(
        walletCryptoEntity: args.walletCryptoEntity,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(224, 43, 87, 1),
        elevation: 0,
        child: const Icon(
          Icons.arrow_right_alt_sharp,
        ),
      ),
    );
  }
}

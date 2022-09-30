import 'package:flutter/material.dart';

import '../convert_%20currency/convert_currency_args.dart';
import '../convert_%20currency/widgets/bottom_sheet_amout_to_convert.dart';
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
      body: BodyConvertCurrencyPage(
        walletCryptoEntity: args.walletCryptoEntity,
      ),
      bottomSheet: const BottomSheetAmountToConvert(),
    );
  }
}

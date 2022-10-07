import 'package:crypto_app/presenter/pages/convert_%20currency/widgets/bottom_sheet_amout_to_convert.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/app_bar_app.dart';
import 'convert_currency_args.dart';
import 'widgets/body_convert_currency.dart';

class ConvertCurrencyPage extends StatelessWidget {
  const ConvertCurrencyPage({Key? key, required this.args}) : super(key: key);

  final ConvertCurrencyArgs args;
  static const route = '/convert_currency';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarApp(
        visibility: false,
        title: "Converter",
      ),
      body: BodyConvertCurrencyPage(
        walletCryptoEntity: args.walletCryptoEntity,
      ),
      bottomSheet: const BottomSheetAmountToConvert(),
    );
  }
}

import 'package:crypto_app/domain/entities/crypto_entity.dart';
import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:crypto_app/presenter/controllers/currency_convert/converted_currency.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../controllers/currency_convert/convert_quantity_provider.dart';
import '../../../controllers/currency_convert/to_convert_currency.dart';

class BottomSheetAmountToConvert extends HookConsumerWidget {
  const BottomSheetAmountToConvert({
    Key? key,
  }) : super(key: key);

  String getToConvertQauntity(double convertQuantity,
      WalletCryptoEntity convertedCurrency, CryptoEntity toConvertCurrency) {
    double value = convertQuantity *
        double.parse(convertedCurrency.crypto.currentPrice.toString()) /
        double.parse(toConvertCurrency.currentPrice.toString());

    if (value > 1) {
      return NumberFormat.decimalPattern().format(value);
    }
    return value.toStringAsFixed(10).replaceAll('.', ',');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toConvertCurrency = ref.watch(toConvertCurrencyProvider);
    final convertedCurrency = ref.watch(convertedCurrencyProvider);
    final convertQuantity = ref.watch(convertQuantityProvider);

    return Container(
      height: 80,
      width: double.maxFinite,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(227, 228, 235, 1),
          ),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total estimado:',
            style: TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 15,
            ),
          ),
          Text(
            '${getToConvertQauntity(convertQuantity, convertedCurrency, toConvertCurrency)} ${toConvertCurrency.symbol.toUpperCase()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}

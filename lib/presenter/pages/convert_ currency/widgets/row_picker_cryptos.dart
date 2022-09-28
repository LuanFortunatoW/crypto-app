import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/wallet_entity.dart';
import '../../../controllers/currency_convert/converted_currency.dart';
import '../../../controllers/currency_convert/to_convert_currency.dart';
import 'button_select_currency.dart';
import 'button_swap_cryptos.dart';

class RowPickerCryptos extends HookConsumerWidget {
  const RowPickerCryptos({Key? key, required this.data}) : super(key: key);

  final WalletEntity data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertedCurrency = ref.watch(convertedCurrencyProvider);
    final toConvertCurrency = ref.watch(toConvertCurrencyProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonSelectCurrency(
            cryptoEntity: convertedCurrency.crypto,
            data: data,
            provider: convertedCurrencyProvider,
          ),
          ButtonSwapCryptos(data: data),
          ButtonSelectCurrency(
            cryptoEntity: toConvertCurrency.crypto,
            data: data,
            provider: toConvertCurrencyProvider,
          ),
        ],
      ),
    );
  }
}

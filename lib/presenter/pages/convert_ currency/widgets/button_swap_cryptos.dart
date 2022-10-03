import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/wallet_entity.dart';
import '../../../controllers/convertion_validation/convert_validation_provider.dart';
import '../../../controllers/currency_convert/convert_quantity_provider.dart';
import '../../../controllers/currency_convert/converted_currency.dart';
import '../../../controllers/currency_convert/to_convert_currency.dart';

class ButtonSwapCryptos extends HookConsumerWidget {
  const ButtonSwapCryptos({
    Key? key,
    required this.data,
  }) : super(key: key);

  final WalletEntity data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertedCurrency = ref.watch(convertedCurrencyProvider);
    final toConvertCurrency = ref.watch(toConvertCurrencyProvider);
    return IconButton(
      onPressed: () {
        if (toConvertCurrency.crypto.id != '') {
          final aux = convertedCurrency;
          ref.read(convertedCurrencyProvider.notifier).state =
              data.getWalletCryptoEntityById(toConvertCurrency.crypto);
          ref.read(toConvertCurrencyProvider.notifier).state = aux;
          ref.read(convertValidationProvider.notifier).validateconversion(
                ref.read(convertQuantityProvider),
                ref.read(convertedCurrencyProvider),
                ref.read(toConvertCurrencyProvider),
              );
        }
      },
      icon: ImageIcon(
        Image.asset('assets/icons/swap.png').image,
      ),
    );
  }
}

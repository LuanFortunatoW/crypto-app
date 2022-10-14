import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/currency_convert/converted_currency.dart';

class ContainerInfoBalanceAmount extends HookConsumerWidget {
  const ContainerInfoBalanceAmount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final convertedCurrency = ref.watch(convertedCurrencyProvider);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: const Color.fromRGBO(245, 246, 250, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.availableBalance,
            style: const TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 14,
            ),
          ),
          Text(
            '${convertedCurrency.quantity.toString().replaceAll('.', ',')} ${convertedCurrency.crypto.symbol.toUpperCase()}',
            style: const TextStyle(
              color: Color.fromRGBO(47, 47, 51, 1),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

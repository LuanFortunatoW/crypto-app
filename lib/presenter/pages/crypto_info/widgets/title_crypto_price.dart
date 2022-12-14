import '../../../../l10n/app_localizations.dart';

import '../../../../shared/controllers/visibility_provider.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../controllers/chart_subtitles/price_in_chart_provider.dart';

class TitleCryptoPrice extends HookConsumerWidget {
  const TitleCryptoPrice({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(priceInChartProvider.state);
    final visibility = ref.watch(visibilityProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Visibility(
            replacement: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            visible: visibility,
            child: Text(
              NumberFormat.simpleCurrency(
                locale: AppLocalizations.of(context)!.languageSymbol,
                decimalDigits: price.state > Decimal.parse('1') ? 2 : 7,
              ).format(
                double.parse(
                  price.state.toString(),
                ),
              ),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:crypto_app/presenter/controllers/visibility/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../controllers/chart_subtitles/price_in_chart_provider.dart';

class TitleCryptoPrice extends HookConsumerWidget {
  const TitleCryptoPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(priceInChartProvider.state);
    final visibility = ref.watch(visibilityProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Visibility(
            visible: visibility,
            child: Text(
              NumberFormat.currency(symbol: 'R\$').format(
                double.parse(price.state.toString()),
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
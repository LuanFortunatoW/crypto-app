import 'package:crypto_app/presenter/controllers/chart_subtitles/price_in_chart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RowCurrentPrice extends HookConsumerWidget {
  const RowCurrentPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(priceInChartProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Preço Atual',
            style: TextStyle(
              fontSize: 19,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
          Text(
            NumberFormat.currency(symbol: 'R\$').format(
              double.parse(price.toString()),
            ),
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}

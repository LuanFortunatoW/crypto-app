import 'package:crypto_app/presenter/controllers/chart_subtitles/variation_in_chart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RowLastDayVariation extends HookConsumerWidget {
  const RowLastDayVariation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variation = ref.watch(variationInChartProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Variação 24H',
            style: TextStyle(
              fontSize: 19,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
          Text(
            NumberFormat.decimalPercentPattern(decimalDigits: 2)
                .format(variation),
            style: TextStyle(
              fontSize: 19,
              color: variation < 0 ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

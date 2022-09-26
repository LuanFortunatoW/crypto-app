import 'package:crypto_app/presenter/pages/crypto_info/details_args.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../controllers/chart_subtitles/price_in_chart_provider.dart';
import '../../../controllers/chart_subtitles/variation_in_chart_provider.dart';
import 'button_convert_currency.dart';
import 'crypto_info_chart.dart';
import 'divider_crypto_info.dart';
import 'row_crypto_infos.dart';
import 'row_crypto_monetary_info.dart';

class BodyInfoPage extends HookConsumerWidget {
  const BodyInfoPage({
    required this.args,
    Key? key,
  }) : super(key: key);

  final CryptoInfoArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(priceInChartProvider);
    final variation = ref.watch(variationInChartProvider);
    final walletCryptoEntity = args.walletCryptoEntity;

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            RowCryptoInfos(walletCryptoEntity: walletCryptoEntity),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: CryptoInfoChart(args: args),
            ),
            const DividerCryptoInfo(),
            RowCryptoMonetaryInfo(
              label: 'Preço atual',
              text: NumberFormat.currency(symbol: 'R\$').format(
                double.parse(
                  price.toString(),
                ),
              ),
              color: Colors.black,
            ),
            const DividerCryptoInfo(),
            RowCryptoMonetaryInfo(
              label: 'Variação 24h',
              text: NumberFormat.decimalPercentPattern(decimalDigits: 2)
                  .format(variation),
              color: variation < 0 ? Colors.red : Colors.green,
            ),
            const DividerCryptoInfo(),
            RowCryptoMonetaryInfo(
              label: 'Quantidade',
              text:
                  '${NumberFormat.decimalPattern().format(walletCryptoEntity.quantity)} ${walletCryptoEntity.crypto.symbol.toUpperCase()}',
              color: Colors.black,
            ),
            const DividerCryptoInfo(),
            RowCryptoMonetaryInfo(
              label: 'Valor',
              text: NumberFormat.currency(symbol: 'R\$').format(
                  walletCryptoEntity.getValueQuantityCrypto().toDouble()),
              color: Colors.black,
            ),
            ButtonConvertCurrency(
              walletCryptoEntity: walletCryptoEntity,
            ),
          ],
        ),
      ),
    );
  }
}

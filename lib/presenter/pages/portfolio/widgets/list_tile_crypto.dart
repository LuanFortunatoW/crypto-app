import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/crypto_entity.dart';
import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../controllers/chart_subtitles/price_in_chart_provider.dart';
import '../../../controllers/chart_subtitles/variation_in_chart_provider.dart';
import '../../../controllers/crypto_history/crypto_history_provider.dart';
import '../../../controllers/crypto_in_wallet/crypto_in_wallet_provider.dart';
import 'crypto_infos_in_tile.dart';
import 'monetary_infos_crypto_in_tile.dart';

class ListTileCrypto extends HookConsumerWidget {
  const ListTileCrypto({
    Key? key,
    required this.walletCryptoEntity,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoHistory = ref.watch(cryptoHistoryProvider.notifier);
    return InkWell(
      onTap: () {
        ref.watch(cryptoInWalletProvider.state).state = walletCryptoEntity;
        cryptoHistory.getCryptoHistory(walletCryptoEntity.crypto);

        CryptoEntity firstEntry = cryptoHistory.state.values.first;
        CryptoEntity secondEntry = cryptoHistory.state.values.toList()[1];
        ref.watch(priceInChartProvider.state).state = firstEntry.price;
        ref.watch(variationInChartProvider.state).state =
            (double.parse(firstEntry.price.toString()) -
                    double.parse(secondEntry.price.toString())) /
                double.parse(secondEntry.price.toString());
        Navigator.pushNamed(context, '/crypto_info');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CryptoInfosInTile(walletCryptoEntity: walletCryptoEntity),
            MonetaryInfosCryptoInTile(walletCryptoEntity: walletCryptoEntity),
          ],
        ),
      ),
    );
  }
}

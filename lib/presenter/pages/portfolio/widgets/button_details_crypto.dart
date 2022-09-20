import 'package:crypto_app/presenter/controllers/chart_subtitles/price_in_chart_provider.dart';
import 'package:crypto_app/presenter/controllers/chart_subtitles/variation_in_chart_provider.dart';
import 'package:crypto_app/presenter/controllers/crypto_history/crypto_history_provider.dart';
import 'package:crypto_app/presenter/controllers/crypto_in_wallet/crypto_in_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/crypto_entity.dart';
import '../../../../domain/entities/wallet_crypto_entity.dart';

class ButtonDetailsCrypto extends HookConsumerWidget {
  const ButtonDetailsCrypto({
    required this.walletCryptoEntity,
    Key? key,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoHistory = ref.watch(cryptoHistoryProvider.notifier);
    return IconButton(
      alignment: Alignment.topCenter,
      onPressed: () {
        ref.watch(cryptoInWalletProvider.state).state = walletCryptoEntity;
        cryptoHistory.getCryptoHistory(walletCryptoEntity.crypto);

        CryptoEntity firstEntry = cryptoHistory.state.values.first;
        CryptoEntity secondEntry = cryptoHistory.state.values.toList()[1];
        ref.watch(priceInChartProvider.state).state = firstEntry.price;
        ref.watch(variationInChartProvider.state).state =
            double.parse(firstEntry.price.toString()) -
                double.parse(secondEntry.price.toString()) /
                    double.parse(secondEntry.price.toString());
        Navigator.pushNamed(context, '/crypto_info');
      },
      icon: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 14,
        color: Colors.grey.shade800,
      ),
    );
  }
}

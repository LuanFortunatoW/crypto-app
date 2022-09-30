import '../../crypto_info/details_args.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../controllers/chart_subtitles/price_in_chart_provider.dart';
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
    return InkWell(
      onTap: () {
        ref.watch(priceInChartProvider.state).state =
            walletCryptoEntity.crypto.currentPrice;
        Navigator.pushNamed(
          context,
          '/crypto_info',
          arguments: CryptoInfoArgs(walletCryptoEntity: walletCryptoEntity),
        );
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

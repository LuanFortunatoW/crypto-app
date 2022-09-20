import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../controllers/crypto_in_wallet/crypto_in_wallet_provider.dart';

class RowValueInWallet extends HookConsumerWidget {
  const RowValueInWallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletCryptoEntity = ref.watch(cryptoInWalletProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Valor',
            style: TextStyle(
              fontSize: 19,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
          Text(
            NumberFormat.currency(symbol: 'R\$')
                .format(walletCryptoEntity.getValueQuantityCrypto().toDouble()),
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}

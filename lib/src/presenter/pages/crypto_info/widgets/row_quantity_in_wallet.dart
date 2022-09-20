import 'package:crypto_app/src/presenter/controllers/crypto_in_wallet/crypto_in_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class RowQuantityInWallet extends HookConsumerWidget {
  const RowQuantityInWallet({
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
            'Quantidade',
            style: TextStyle(
              fontSize: 19,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
          Text(
            '${NumberFormat.decimalPattern().format(walletCryptoEntity.quantity)} ${walletCryptoEntity.crypto.initials}',
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}

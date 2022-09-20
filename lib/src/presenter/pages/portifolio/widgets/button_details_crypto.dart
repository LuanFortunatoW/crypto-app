import 'package:crypto_app/src/presenter/controllers/crypto_history/crypto_history_provider.dart';
import 'package:crypto_app/src/presenter/controllers/crypto_in_wallet/crypto_in_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';

class ButtonDetailsCrypto extends HookConsumerWidget {
  const ButtonDetailsCrypto({
    required this.walletCryptoEntity,
    Key? key,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      alignment: Alignment.topCenter,
      onPressed: () {
        ref.watch(cryptoInWalletProvider.state).state = walletCryptoEntity;
        ref
            .read(cryptoHistoryProvider.notifier)
            .getCryptoHistory(walletCryptoEntity.crypto);
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

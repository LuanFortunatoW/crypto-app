import 'package:crypto_app/presenter/controllers/crypto_in_wallet/crypto_in_wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RowCryptoInfos extends HookConsumerWidget {
  const RowCryptoInfos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletCryptoEntity = ref.watch(cryptoInWalletProvider);
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        right: 18,
        left: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                walletCryptoEntity.crypto.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                walletCryptoEntity.crypto.symbol,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(117, 118, 128, 1),
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: Image.network(
              walletCryptoEntity.crypto.image,
            ).image,
            radius: 24,
          ),
        ],
      ),
    );
  }
}

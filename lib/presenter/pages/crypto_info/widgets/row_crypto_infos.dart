import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RowCryptoInfos extends HookConsumerWidget {
  const RowCryptoInfos({
    required this.walletCryptoEntity,
    Key? key,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

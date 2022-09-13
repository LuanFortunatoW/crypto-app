import 'package:flutter/material.dart';

import '../../../../domain/entities/wallet_crypto_entity.dart';
import 'crypto_infos_in_tile.dart';
import 'monetary_infos_crypto_in_tile.dart';

class ListTileCrypto extends StatelessWidget {
  const ListTileCrypto({
    Key? key,
    required this.walletCryptoEntity,
  }) : super(key: key);

  final WalletCryptoEntity walletCryptoEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CryptoInfosInTile(walletCryptoEntity: walletCryptoEntity),
          MonetaryInfosCryptoInTile(walletCryptoEntity: walletCryptoEntity),
        ],
      ),
    );
  }
}
